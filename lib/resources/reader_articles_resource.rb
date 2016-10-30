module WebmachineHALJSONAPIDemo
  class ReaderArticlesResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      @reader = Reader[request.path_info[:reader_id]]
      @articles = @reader.articles
      !@articles.empty?
    end

    private

    def to_json
      extend(ReaderArticlesRepresenter).to_json
    end
  end
end
