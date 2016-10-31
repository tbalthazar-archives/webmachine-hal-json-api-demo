module WebmachineHALJSONAPIDemo
  module Categories
    class UpdateService
      def initialize(category, params)
        @category = category
        @params = params
      end

      def execute
        @category.set(@params)
        @category.save if @category.valid?
        @category
      end
    end
  end
end
