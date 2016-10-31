module WebmachineHALJSONAPIDemo
  class ReaderResource < BaseResource
    def allowed_methods
      %w(GET PUT DELETE)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      @reader = Reader[request.path_info[:id]]
    end

    def delete_resource
      Readers::DeleteService.new(@reader).execute
      true
    end

    private

    def to_json
      @reader.extend(ReaderRepresenter).to_json
    end

    def from_json
      r = Readers::UpdateService.new(@reader, params).execute
      r.valid? ? '' : render_error(400, r)
    end
  end
end
