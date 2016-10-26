class APIResource < BaseResource
  def allowed_methods
    ['GET']
  end

  def is_authorized?(authorization_header = nil)
    true
  end

  private

  def to_json
    base_uri = request.base_uri
    %Q|{
      "_links": {
        "self": {"href": "#{base_uri}"}
      }
    }|
  end
end
