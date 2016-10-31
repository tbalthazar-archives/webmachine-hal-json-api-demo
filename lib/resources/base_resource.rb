module WebmachineHALJSONAPIDemo
  class BaseResource < Webmachine::Resource
    def content_types_provided
      [['application/hal+json', :to_json]]
    end

    def is_authorized?(authorization_header = nil)
      return false unless authorization_header =~ /^Bearer .+/

      token = authorization_header.split.last
      !User.where(token: token).empty?
    end

    private

    def params
      body = request.body.to_s
      body.nil? ? {} : JSON.parse(body)
    end

    def render_error(code, object)
      response.body = object.extend(ErrorRepresenter).to_json
      response.code = code
    end
  end
end
