module WebmachineHALJSONAPIDemo
  module ArticleRepresenter
    include Roar::JSON::HAL

    link(:self) { "/articles/#{id}" }
    link(:prev) do
      "/articles/#{represented.previous.id}" if represented.previous
    end
    link(:next) do
      "/articles/#{represented.next.id}" if represented.next
    end

    property :id
    property :title
    property :link
    property :nb_readers, getter: proc { readers.length }
  end
end
