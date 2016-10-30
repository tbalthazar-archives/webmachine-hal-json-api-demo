module WebmachineHALJSONAPIDemo
  module ReadersRepresenter
    include Roar::JSON::HAL

    link(:self) { '/readers' }
    collection :readers, getter: proc { @readers },
                         decorator: ReaderRepresenter,
                         embedded: true
    property :length, getter: proc { @readers.length }
  end
end
