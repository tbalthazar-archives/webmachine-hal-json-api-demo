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

      Category.all.count > 0
    end

    def post_is_create?
      true
    end

    def create_path
      "/categories/#{Category.next_id}"
    end

    private

    def to_json
      @categories = fetch_categories
      extend(CategoriesRepresenter).to_json
    end

    def from_json
      c = Categories::CreateService.new(params).execute
      c.valid? ? '' : render_error(400, c)
    end

    def fetch_categories
      if request.query && request.query['name']
        Categories::SearchService.new(request.query).execute
      else
        Category.all
      end
    end
  end
end
