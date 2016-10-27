module WebmachineHALJSONAPIDemo
  module ArticlesRepresenter
    include Roar::JSON::HAL

    collection :articles, getter: proc { @articles },
                          decorator: ArticleRepresenter

    link(:self) { "/categories/#{@category.id}/articles" }
    links(:articles) do
      @articles.map { |a| { href: "/articles/#{a.id}" } }
    end
  end
end
