module WebmachineHALJSONAPIDemo
  class AccessResource < BaseResource
    def allowed_methods
      %w(POST DELETE)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      return false unless article && reader
      return false if delete? && access.nil?

      true
    end

    def post_is_create?
      false
    end

    def process_post
      access || Access.create(reader_id: reader.id, article_id: article.id)
      true
    end

    def delete_resource
      access.destroy
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

    def delete?
      request.method == 'DELETE'
    end
  end
end
