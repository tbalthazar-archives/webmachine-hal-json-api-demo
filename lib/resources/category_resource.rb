module WebmachineHALJSONAPIDemo
  class CategoryResource < BaseResource
    def allowed_methods
      %w(GET PUT DELETE)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      @category = Category[request.path_info[:id]]
    end

    def delete_resource
      @category.destroy
      true
    end

    private

    def to_json
      @category.extend(CategoryRepresenter).to_json
    end

    def from_json
      return '' if update_category

      render_error(400, @error)
    end

    def update_category
      @category.update(params)
      true
    rescue StandardError => e
      @error = e
      nil
    end
  end
end
