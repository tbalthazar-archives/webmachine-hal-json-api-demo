module WebmachineHALJSONAPIDemo
  module CategoriesRepresenter
    include Roar::JSON::HAL

    link(:self) { '/categories' }
    link(:search) do
      { href: '/categories{?name}', templated: true }
    end
    collection :categories, getter: proc { @categories },
                            decorator: CategoryRepresenter,
                            embedded: true
    property :length, getter: proc { @categories.length }
  end
end
