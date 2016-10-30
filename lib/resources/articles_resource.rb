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
      "/categories/#{category_id}/articles/#{Article.next_id}"
    end

    private

    def to_json
      extend(ArticlesRepresenter).to_json
    end

    def from_json
      return '' if create_article

      response.body = @error.extend(ErrorRepresenter).to_json
      response.code = 400
    end

    def create_article
      @article = Article.create(params.merge(category_id: category_id))
    rescue StandardError => e
      @error = e
      nil
    end

    def category_id
      request.path_info[:category_id]
    end
  end
end
