module WebmachineHALJSONAPIDemo
  module ArticlesRepresenter
    include Roar::JSON::HAL

    link(:self) { "/categories/#{@category.id}/articles" } if @category
    link(:self) { '/articles' } unless @category
    link(:search) do
      { href: '/articles{?title}', templated: true }
    end
    collection :articles, getter: proc { @articles },
                          decorator: ArticleRepresenter,
                          embedded: true
    property :length, getter: proc { @articles.count }
  end
end
