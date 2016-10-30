module WebmachineHALJSONAPIDemo
  module ArticlesRepresenter
    include Roar::JSON::HAL

    link(:self) { "/categories/#{@category.id}/articles" }
    collection :articles, getter: proc { @articles },
                          decorator: ArticleRepresenter,
                          embedded: true
    property :length, getter: proc { @articles.count }
  end
end
