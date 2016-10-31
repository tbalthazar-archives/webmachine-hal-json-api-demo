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

      articles?
    end

    def post_is_create?
      true
    end

    def create_path
      "/categories/#{category_id}/articles/#{Article.next_id}"
    end

    private

    def to_json
      @category = Category[category_id]
      @articles = fetch_articles
      extend(ArticlesRepresenter).to_json
    end

    def from_json
      a = Articles::CreateService.new(params).execute
      a.valid? ? '' : render_error(400, a)
    end

    def fetch_articles
      if request.query && request.query['title']
        Articles::SearchService.new(request.query).execute
      else
        Article.where(category_id: category_id)
      end
    end

    def category_id
      request.path_info[:category_id]
    end

    def params
      super.merge(category_id: category_id)
    end

    def articles?
      if category_id
        Article.where(category_id: category_id).count > 0
      else
        Article.all.count > 0
      end
    end
  end
end
