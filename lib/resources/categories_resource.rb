module WebmachineHALJSONAPIDemo
  class CategoriesResource < BaseResource
    def allowed_methods
      %w(GET POST)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      return true if request.method == 'POST'

      @categories = Category.all
    end

    def post_is_create?
      true
    end

    def create_path
      "/categories/#{Category.next_id}"
    end

    private

    def to_json
      extend(CategoriesRepresenter).to_json
    end

    def from_json
      return '' if create_category

      render_error(400, @error)
    end

    def create_category
      @category = Category.create(params)
    rescue StandardError => e
      @error = e
      nil
    end
  end
end
