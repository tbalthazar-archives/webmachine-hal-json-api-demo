module WebmachineHALJSONAPIDemo
  class ArticleResource < BaseResource
    def allowed_methods
      %w(GET PUT DELETE)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      @article = Article[request.path_info[:id]]
    end

    def delete_resource
      Articles::DeleteService.new(@article).execute
      true
    end

    private

    def to_json
      @article.extend(ArticleRepresenter).to_json
    end

    def from_json
      a = Articles::UpdateService.new(@article, params).execute
      a.valid? ? '' : render_error(400, a)
    end
  end
end
