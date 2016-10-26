require_relative '../../db/setup'

DB = Sequel.connect('sqlite://db/test.db')
Database.setup

require 'rack/test'
require 'minitest/spec'
require 'webmachine/adapters/rack'
require 'factory_girl'
require_relative '../../app'

module AppHelper
  def app
    Webmachine::Adapters::Rack.new(App)
  end
end

class MinitestWorld
  include Minitest::Assertions
  attr_accessor :assertions

  def initialize
    self.assertions = 0
  end
end

World Rack::Test::Methods, AppHelper
World(FactoryGirl::Syntax::Methods)
World do
  MinitestWorld.new
end
