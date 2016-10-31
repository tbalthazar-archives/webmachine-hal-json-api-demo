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
      Categories::DeleteService.new(@category).execute
      true
    end

    private

    def to_json
      @category.extend(CategoryRepresenter).to_json
    end

    def from_json
      c = Categories::UpdateService.new(@category, params).execute
      c.valid? ? '' : render_error(400, c)
    end
  end
end
