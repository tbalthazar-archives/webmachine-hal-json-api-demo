module WebmachineHALJSONAPIDemo
  module Categories
    class DeleteService
      def initialize(category)
        @category = category
      end

      def execute
        @category.destroy
      end
    end
  end
end
