module WebmachineHALJSONAPIDemo
  module ArticleReadersRepresenter
    include Roar::JSON::HAL

    link(:self) { "/articles/#{@article.id}/readers" }
    collection :readers, getter: proc { @readers },
                         decorator: ReaderRepresenter,
                         embedded: true
    property :length, getter: proc { @readers.length }
  end
end
