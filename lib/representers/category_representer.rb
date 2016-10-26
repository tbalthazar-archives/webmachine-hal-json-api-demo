module WebmachineHALJSONAPIDemo
  module CategoryRepresenter
    include Roar::JSON::HAL

    link(:self) { "/categories/#{id}" }

    property :id
    property :name
  end
end
