module WebmachineHALJSONAPIDemo
  class BaseResource < Webmachine::Resource
    def content_types_provided
      [['application/hal+json', :to_json]]
    end

    def is_authorized?(_authorization_header = nil)
      false
    end

    private

    def params
      body = request.body.to_s
      body.nil? ? {} : JSON.parse(body)
    end
  end
end
