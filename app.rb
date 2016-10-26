$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'webmachine_hal_json_api_demo'

App = Webmachine::Application.new do |app|
  app.routes do
    add [], WebmachineHALJSONAPIDemo::APIResource
    add ['tokens'], WebmachineHALJSONAPIDemo::TokensResource
  end
end
