module WebmachineHALJSONAPIDemo
  class CategoryResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      @category = Category[request.path_info[:id]]
    end

    private

    def to_json
      @category.extend(CategoryRepresenter).to_json
    end
  end
end
