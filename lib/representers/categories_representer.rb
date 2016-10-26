module WebmachineHALJSONAPIDemo
  module CategoriesRepresenter
    include Roar::JSON::HAL

    collection :categories, getter: proc { @categories },
                            decorator: CategoryRepresenter

    link(:self) { '/categories' }
    links(:categories) do
      @categories.map { |o| { href: "/categories/#{o.id}" } }
    end
  end
end
