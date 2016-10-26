require 'rack/test'
require 'minitest/spec'
require 'webmachine/adapters/rack'
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
World do
  MinitestWorld.new
end
