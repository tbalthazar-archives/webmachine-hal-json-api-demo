module WebmachineHALJSONAPIDemo
  module ArticlesRepresenter
    include Roar::JSON::HAL

    link(:self) { "/categories/#{@category.id}/articles" }
    link(:find) do
      { href: '/articles{?id}', templated: true }
    end
    collection :articles, getter: proc { @articles },
                          decorator: ArticleRepresenter,
                          embedded: true
    property :length, getter: proc { @articles.count }
  end
end
