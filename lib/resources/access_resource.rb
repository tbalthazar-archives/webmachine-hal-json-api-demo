module WebmachineHALJSONAPIDemo
  class AccessResource < BaseResource
    def allowed_methods
      %w(POST)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      return false unless article && reader
      return false if revoke? && access.nil?

      true
    end

    def post_is_create?
      false
    end

    def process_post
      if revoke?
        Accesses::DeleteService.new(reader.id, article.id).execute
      else
        Accesses::CreateService.new(reader.id, article.id).execute
      end
      true
    end

    private

    def from_json
      ''
    end

    def article
      @article ||= Article[article_id]
    end

    def article_id
      request.path_info[:article_id]
    end

    def reader
      @reader ||= Reader[reader_id]
    end

    def reader_id
      params['reader_id']
    end

    def access
      @access ||= Access.where(reader_id: reader.id,
                               article_id: article.id).first
    end

    def revoke?
      request.routing_tokens.last == 'revoke_access'
    end
  end
end
