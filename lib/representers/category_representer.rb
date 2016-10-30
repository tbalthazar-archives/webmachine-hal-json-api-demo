module WebmachineHALJSONAPIDemo
  class CategoryRepresenter < Roar::Decorator
    include Roar::JSON::HAL

    link(:self) { "/categories/#{represented.id}" }
    link(:prev) do
      "/categories/#{represented.previous.id}" if represented.previous
    end
    link(:next) do
      "/categories/#{represented.next.id}" if represented.next
    end

    property :id
    property :name
    property :nb_articles, getter: proc { articles.length }
  end
end
