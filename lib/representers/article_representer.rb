module WebmachineHALJSONAPIDemo
  module ArticleRepresenter
    include Roar::JSON::HAL

    link(:self) { "/articles/#{id}" }

    property :id
    property :title
    property :link
  end
end
