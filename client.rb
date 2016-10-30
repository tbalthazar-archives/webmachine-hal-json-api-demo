require 'hyperresource'

class Client
  ROOT = 'http://localhost:8080'.freeze
  MEDIA_TYPE = 'application/hal+json'.freeze

  def initialize
    @api = HyperResource.new(
      root: ROOT,
      headers: {
        'Accept' => MEDIA_TYPE,
        'Content-Type' => MEDIA_TYPE
      }
    )
    @api.get
  end

  def login
    email = 'alice@example.org'
    pwd = 'alice-pwd'

    puts "Logging in with #{email}/#{pwd} ..."

    resp = @api.tokens.post(email: email, password: pwd)
    token = resp.body['token']

    File.open(token_path, 'w') do |f|
      f.write(token)
    end

    puts "Token has been stored in #{token_path}"
  end

  def categories
    set_authorization_header
    puts '--- list of categories:'
    @api.categories.categories.each do |c|
      puts "- #{c.name}"
    end
  end

  def first_category
    set_authorization_header
    c = @api.categories.find(1).first
    puts "- first category name is: #{c.name}"

    n = c.next.get
    puts "- next category name is: #{n.name}"
  end

  private

  def token_path
    Dir.pwd + '/.token'
  end

  def set_authorization_header
    token = File.open(token_path, &:gets)
    @api.headers = @api.headers.merge('Authorization' => "Bearer #{token}")
  rescue
    puts "Error while trying to read token in #{token_path}."
    puts "Please try to run the 'login' command."
  end
end

AVAILABLE_CMDS = %w(help login categories first_category).freeze

cmd = ARGV[0]
if AVAILABLE_CMDS.include?(cmd)
  if cmd == 'help'
    puts 'help here'
  else
    begin
      client = Client.new
      client.send(cmd)
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end
else
  puts "'#{cmd}' not in #{AVAILABLE_CMDS}"
end
