module WebmachineHALJSONAPIDemo
  module Readers
    class UpdateService
      def initialize(reader, params)
        @reader = reader
        @params = params
      end

      def execute
        @reader.set(@params)
        @reader.save if @reader.valid?
        @reader
      end
    end
  end
end
