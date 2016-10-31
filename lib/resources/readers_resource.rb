module WebmachineHALJSONAPIDemo
  class ReadersResource < BaseResource
    def allowed_methods
      %w(GET POST)
    end

    def content_types_accepted
      [['application/hal+json', :from_json]]
    end

    def resource_exists?
      return true if request.method == 'POST'

      Reader.all.count > 0
    end

    def post_is_create?
      true
    end

    def create_path
      "/readers/#{Reader.next_id}"
    end

    def from_json
      r = Readers::CreateService.new(params).execute
      r.valid? ? '' : render_error(400, r)
    end

    private

    def to_json
      @readers = Reader.all
      extend(ReadersRepresenter).to_json
    end
  end
end
