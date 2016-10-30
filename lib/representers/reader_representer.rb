module WebmachineHALJSONAPIDemo
  module ReaderRepresenter
    include Roar::JSON::HAL

    link(:self) { "/readers/#{id}" }
    link(:articles) { "/readers/#{id}/articles" }
    link(:prev) do
      "/readers/#{represented.previous.id}" if represented.previous
    end
    link(:next) do
      "/readers/#{represented.next.id}" if represented.next
    end

    property :id
    property :email
    property :name
  end
end
