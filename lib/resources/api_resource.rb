module WebmachineHALJSONAPIDemo
  class APIResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def is_authorized?(_authorization_header = nil)
      true
    end

    private

    def to_json
      base_uri = request.base_uri
      %({
        "_links": {
          "self": {"href": "#{base_uri}"}
        }
      })
    end
  end
end
