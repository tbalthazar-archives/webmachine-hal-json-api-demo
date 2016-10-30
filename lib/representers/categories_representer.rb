module WebmachineHALJSONAPIDemo
  module CategoriesRepresenter
    include Roar::JSON::HAL

    link(:self) { '/categories' }
    link(:find) do
      { href: '/categories{?id}', templated: true }
    end
    collection :categories, getter: proc { @categories },
                            decorator: CategoryRepresenter,
                            embedded: true
    property :length, getter: proc { @categories.length }
  end
end
