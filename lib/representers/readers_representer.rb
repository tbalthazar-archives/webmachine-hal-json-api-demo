module WebmachineHALJSONAPIDemo
  module ReadersRepresenter
    include Roar::JSON::HAL

    link(:self) { '/readers' }
    link(:find) do
      { href: '/readers{?id}', templated: true }
    end
    collection :readers, getter: proc { @readers },
                         decorator: ReaderRepresenter,
                         embedded: true
    property :length, getter: proc { @readers.length }
  end
end
