module WebmachineHALJSONAPIDemo
  module Readers
    class CreateService
      def initialize(params)
        @params = params
      end

      def execute
        r = Reader.new(@params)
        r.save if r.valid?
        r
      end
    end
  end
end
