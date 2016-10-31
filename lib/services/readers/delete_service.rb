module WebmachineHALJSONAPIDemo
  module Readers
    class DeleteService
      def initialize(reader)
        @reader = reader
      end

      def execute
        @reader.destroy
      end
    end
  end
end
