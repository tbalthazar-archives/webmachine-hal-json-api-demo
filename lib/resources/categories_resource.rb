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
      "/categories/#{next_id}"
    end

    private

    def to_json
      extend(CategoriesRepresenter).to_json
    end

    def from_json
      return '' if create_category

      response.body = @error.extend(ErrorRepresenter).to_json
      response.code = 400
    end

    def create_category
      @category = Category.create(params)
    rescue StandardError => e
      @error = e
      nil
    end

    def next_id
      # TODO: not the best way to really determine the next id.
      # Try to look for sequence:
      # https://stackoverflow.com/questions/107005/predict-next-auto-inserted-row-id-sqlite#5301923
      DB[:categories].max(:id)
    end
  end
end
