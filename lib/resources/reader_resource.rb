module WebmachineHALJSONAPIDemo
  class ReaderResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      @reader = Reader[request.path_info[:id]]
    end

    private

    def to_json
      @reader.extend(ReaderRepresenter).to_json
    end
  end
end
