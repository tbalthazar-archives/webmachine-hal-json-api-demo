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

  def token
    resp = @api.tokens.post(email: 'alice@example.org', password: 'alice-pwd')
    @token = resp.body['token']
    @api.headers = @api.headers.merge('Authorization' => "Bearer #{@token}")
  end

  def categories
    puts '--- list of categories: '
    @api.categories.categories.each do |c|
      puts "- #{c.name}"
    end
    categories = @api.categories
    puts "- first category name is: #{categories.find(1).first.name}"
  end
end

client = Client.new
client.token
client.categories
