class BaseResource < Webmachine::Resource
  def content_types_provided
    [['application/hal+json', :to_json]]
  end

  def is_authorized?(authorization_header = nil)
    false
  end
end
