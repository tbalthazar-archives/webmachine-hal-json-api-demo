require 'hyperresource'

class Client
  ROOT = 'http://localhost:8080'.freeze
  MEDIA_TYPE = 'application/hal+json'.freeze
  CMDS = {
    help: {},
    login: {},
    categories: {
      list: {},
      search: {
        prompt: 'Enter your search term:'
      },
      new: {
        prompt: 'Enter a category name:'
      },
      edit: {
        prompt: 'Enter a new name for the first category:'
      },
      delete: {
        prompt: 'Enter a category id:'
      }
    },
    articles: {
      list: {
        prompt: 'Enter a category id:'
      },
      search: {
        prompt: 'Enter your search term:'
      },
      new: {
        prompt: 'Enter an article name:'
      },
      edit: {
        prompt: 'Enter a new name for the first article:'
      },
      delete: {
        prompt: 'Enter an article id:'
      },
      readers: {
        prompt: 'Enter an article id:'
      }
    },
    readers: {
      list: {},
      new: {
        prompt: 'Enter an reader name:'
      },
      edit: {
        prompt: 'Enter a new name for the first reader:'
      },
      delete: {
        prompt: 'Enter a reader id:'
      },
      articles: {
        prompt: 'Enter a reader id:'
      }
    }
  }.freeze

  def self.handle_input
    command = ARGV[0]
    subcommand = ARGV[1]

    if !command_exists?(command) ||
       (subcommand.nil? && subcommand?(command)) ||
       (subcommand && !subcommand_exists?(command, subcommand))
      show_help
      exit(1)
    end

    msg = build_message(command, subcommand)
    c = Client.new
    prompt = prompt(command, subcommand)
    if prompt
      arg = get_input(prompt)
      c.send(msg, arg)
    else
      c.send(msg)
    end
  end

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

  def help
    self.class.show_help
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

  def categories_list
    authenticated_query do
      @api.categories.categories.each do |c|
        puts "- (#{c.id}) #{c.name}"
      end
    end
  end

  def categories_search(term)
    authenticated_query do
      @api.categories.search(name: term).get.each do |c|
        puts "- (#{c.id}) #{c.name}"
      end
    end
  end

  def categories_new(name)
    authenticated_query do
      _ = @api.categories.post(name: name)
    end
  end

  def categories_edit(name)
    authenticated_query do
      c = @api.categories.first
      puts "(#{c.id}) #{c.name} will be renamed: #{name}"
      c.put(name: name)
    end
  end

  def categories_delete(id)
    authenticated_query do
      c = @api.categories.categories.find { |cat| cat.id == id.to_i }
      c.delete
    end
  end

  def articles_list(category_id)
    authenticated_query do
      c = @api.categories.categories.find { |cat| cat.id == category_id.to_i }
      c.articles.articles.each do |a|
        puts "- (#{a.id}) #{a.title}"
      end
    end
  end

  def articles_search(term)
    authenticated_query do
      @api.articles.search(title: term).get.each do |c|
        puts "- (#{c.id}) #{c.title}"
      end
    end
  end

  def articles_new(title)
    authenticated_query do
      c = @api.categories.first
      puts "Creating an article in (#{c.id}) #{c.name}"
      link = "https://example.com/#{title}"
      _ = c.articles.post(title: title, link: link)
    end
  end

  def articles_edit(title)
    authenticated_query do
      a = @api.articles.first
      puts "(#{a.id}) #{a.title} will be changed to: #{title}"
      a.put(title: title)
    end
  end

  def articles_delete(id)
    authenticated_query do
      a = @api.articles.articles.find { |art| art.id == id.to_i }
      a.delete
    end
  end

  def articles_readers(id)
    authenticated_query do
      a = @api.articles.articles.find { |art| art.id == id.to_i }
      a.readers.readers.each do |r|
        puts "- (#{r.id}) #{r.name}"
      end
    end
  end

  def readers_list
    authenticated_query do
      @api.readers.readers.each do |r|
        puts "- (#{r.id}) #{r.name}"
      end
    end
  end

  def readers_new(name)
    authenticated_query do
      email = "#{name}@example.com"
      _ = @api.readers.post(name: name, email: email)
    end
  end

  def readers_edit(name)
    authenticated_query do
      r = @api.readers.first
      puts "(#{r.id}) #{r.name} will be renamed: #{name}"
      r.put(name: name)
    end
  end

  def readers_delete(id)
    authenticated_query do
      r = @api.readers.readers.find { |rea| rea.id == id.to_i }
      r.delete
    end
  end

  def readers_articles(id)
    authenticated_query do
      r = @api.readers.readers.find { |rea| rea.id == id.to_i }
      r.articles.articles.each do |a|
        puts "- (#{a.id}) #{a.title}"
      end
    end
  end

  def self.command_exists?(command)
    !command.nil? && !CMDS[command.to_sym].nil?
  end

  def self.subcommand_exists?(command, subcommand)
    command_exists?(command) &&
      !subcommand.nil? &&
      !CMDS[command.to_sym][subcommand.to_sym].nil?
  end

  def self.subcommand?(command)
    command_exists?(command) &&
      !CMDS[command.to_sym].nil? &&
      !CMDS[command.to_sym].empty?
  end

  def self.prompt(command, subcommand)
    return nil unless subcommand_exists?(command, subcommand)

    CMDS[command.to_sym][subcommand.to_sym].fetch(:prompt, nil)
  end

  def self.build_message(command, subcommand)
    msg = command.to_s
    msg += "_#{subcommand}" unless subcommand.nil? || subcommand.empty?
    msg.strip
  end

  def self.show_help
    puts 'Usage: ruby client.rb COMMAND [SUBCOMMAND]'
    puts 'Available commands/subcommands:'
    CMDS.keys.each do |command|
      line = command.to_s
      if CMDS[command].empty?
        puts '- ' + line
      else
        CMDS[command].each do |subcommand, _|
          line = "#{command} #{subcommand}"
          puts '- ' + line
        end
      end
    end
    puts
    puts 'Example: ruby client.rb categories list'
    puts
  end

  def self.get_input(prompt)
    print prompt + ' '
    STDIN.gets.chomp
  end

  private

  def token_path
    Dir.pwd + '/.token'
  end

  def set_authorization_header
    return unless File.exist?(token_path)

    token = File.open(token_path, &:gets)
    @api.headers = @api.headers.merge('Authorization' => "Bearer #{token}")
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def handle_error(e)
    if e.class == HyperResource::ClientError
      if e.response.status == 401
        puts 'Please login first. Run ruby client.rb help to learn how.'
      elsif e.response.status == 400
        body = JSON.parse(e.response.body)
        puts "Error: #{body['message']}"
      elsif e.response.status == 404
        puts 'Not found.'
      elsif e.response.status == 500
        puts 'Server error :(.'
      else
        puts "Unknown error: #{e.inspect}"
      end
    else
      puts "Unknown error: #{e.inspect}"
    end
  end

  def authenticated_query
    set_authorization_header
    begin
      yield
    rescue StandardError => e
      handle_error(e)
    end
  end
end

Client.handle_input
