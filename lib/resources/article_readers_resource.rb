module WebmachineHALJSONAPIDemo
  class ArticleReadersResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      @article = Article[request.path_info[:article_id]]
      @readers = @article.readers
      !@readers.empty?
    end

    private

    def to_json
      extend(ArticleReadersRepresenter).to_json
    end
  end
end
