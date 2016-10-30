module WebmachineHALJSONAPIDemo
  module ReaderRepresenter
    include Roar::JSON::HAL

    link(:self) { "/readers/#{id}" }
    link(:articles) { "/readers/#{id}/articles" }

    property :id
    property :email
    property :name
  end
end
