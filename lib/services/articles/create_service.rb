module WebmachineHALJSONAPIDemo
  module Articles
    class CreateService
      def initialize(params)
        @params = params
      end

      def execute
        a = Article.new(@params)
        a.save if a.valid?
        a
      end
    end
  end
end
