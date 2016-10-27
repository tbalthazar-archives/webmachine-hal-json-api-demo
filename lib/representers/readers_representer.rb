module WebmachineHALJSONAPIDemo
  module ReadersRepresenter
    include Roar::JSON::HAL

    collection :readers, getter: proc { @readers },
                         decorator: ReaderRepresenter

    link(:self) { '/readers' }
    links(:readers) do
      @readers.map { |r| { href: "/readers/#{r.id}" } }
    end
  end
end
