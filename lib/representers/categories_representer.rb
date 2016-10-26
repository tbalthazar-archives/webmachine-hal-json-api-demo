module WebmachineHALJSONAPIDemo
  module CategoriesRepresenter
    include Roar::JSON::HAL

    link(:self) { '/categories' }
    links(:categories) do
      @categories.map { |o| { href: "/categories/#{o.id}" } }
    end
  end
end
