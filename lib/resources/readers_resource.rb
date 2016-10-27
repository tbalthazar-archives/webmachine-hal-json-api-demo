module WebmachineHALJSONAPIDemo
  class ReadersResource < BaseResource
    def allowed_methods
      ['GET']
    end

    def resource_exists?
      @readers = Reader.all
    end

    private

    def to_json
      extend(ReadersRepresenter).to_json
    end
  end
end
