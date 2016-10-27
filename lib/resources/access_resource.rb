module WebmachineHALJSONAPIDemo
  class AccessResource < BaseResource
    def allowed_methods
      %w(POST)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      @article = Article[article_id]
      @reader = Reader[reader_id]
      @article && @reader
    end

    def post_is_create?
      false
    end

    def process_post
      Access.create(reader_id: @reader.id, article_id: @article.id)
      true
    end

    private

    def from_json
      ''
    end

    def article_id
      request.path_info[:article_id]
    end

    def reader_id
      params['reader_id']
    end
  end
end
