module WebmachineHALJSONAPIDemo
  module ReaderArticlesRepresenter
    include Roar::JSON::HAL

    link(:self) { "/readers/#{@reader.id}/articles" }
    collection :articles, getter: proc { @articles },
                          decorator: ArticleRepresenter,
                          embedded: true
    property :length, getter: proc { @articles.length }
  end
end
