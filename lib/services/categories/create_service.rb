module WebmachineHALJSONAPIDemo
  module Categories
    class CreateService
      def initialize(params)
        @params = params
      end

      def execute
        c = Category.new(@params)
        c.save if c.valid?
        c
      end
    end
  end
end
