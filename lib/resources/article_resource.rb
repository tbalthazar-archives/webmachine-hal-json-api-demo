module WebmachineHALJSONAPIDemo
  class ArticleResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      @article = Article[request.path_info[:id]]
    end

    private

    def to_json
      @article.extend(ArticleRepresenter).to_json
    end
  end
end
