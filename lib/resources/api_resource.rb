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
          "self": {"href": "#{base_uri}"},
          "tokens": {"href": "#{base_uri}tokens"},
          "categories": {"href": "#{base_uri}categories"},
          "articles": {"href": "#{base_uri}articles"},
          "readers": {"href": "#{base_uri}readers"}
        }
      })
    end
  end
end
