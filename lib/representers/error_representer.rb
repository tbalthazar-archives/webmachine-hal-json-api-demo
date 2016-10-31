module WebmachineHALJSONAPIDemo
  module ErrorRepresenter
    include Roar::JSON::HAL

    property :message, getter: proc { errors.full_messages.join(', ') }
  end
end
