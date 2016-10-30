module WebmachineHALJSONAPIDemo
  module ErrorRepresenter
    include Roar::JSON::HAL

    property :message
  end
end
