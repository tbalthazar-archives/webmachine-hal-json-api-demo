module WebmachineHALJSONAPIDemo
  class ArticlesResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      category_id = request.path_info[:category_id]
      @category = Category[category_id]
      @articles = Article.where(category_id: category_id)
      @category && !@articles.empty?
    end

    private

    def to_json
      extend(ArticlesRepresenter).to_json
    end
  end
end
