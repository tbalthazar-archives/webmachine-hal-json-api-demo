module WebmachineHALJSONAPIDemo
  class CategoriesResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      @categories = Category.all
    end

    private

    def to_json
      extend(CategoriesRepresenter).to_json
    end
  end
end
