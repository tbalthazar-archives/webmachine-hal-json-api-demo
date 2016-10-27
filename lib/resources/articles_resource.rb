module WebmachineHALJSONAPIDemo
  class ArticlesResource < BaseResource
    def allowed_methods
      %w(GET POST)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      return true if request.method == 'POST'

      @category = Category[category_id]
      @articles = Article.where(category_id: category_id)
      @category && !@articles.empty?
    end

    def post_is_create?
      true
    end

    def create_path
      "/categories/#{category_id}/articles/#{next_id}"
    end

    private

    def to_json
      extend(ArticlesRepresenter).to_json
    end

    def from_json
      Article.create(params.merge(category_id: category_id))
      ''
    end

    def category_id
      request.path_info[:category_id]
    end

    def next_id
      # TODO: not the best way to really determine the next id.
      # Try to look for sequence:
      # https://stackoverflow.com/questions/107005/predict-next-auto-inserted-row-id-sqlite#5301923
      DB[:articles].max(:id)
    end
  end
end
