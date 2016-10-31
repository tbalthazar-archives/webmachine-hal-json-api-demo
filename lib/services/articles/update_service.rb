module WebmachineHALJSONAPIDemo
  module Articles
    class UpdateService
      def initialize(article, params)
        @article = article
        @params = params
      end

      def execute
        @article.set(@params)
        @article.save if @article .valid?
        @article
      end
    end
  end
end
