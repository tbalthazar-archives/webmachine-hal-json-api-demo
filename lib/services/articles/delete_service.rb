module WebmachineHALJSONAPIDemo
  module Articles
    class DeleteService
      def initialize(article)
        @article = article
      end

      def execute
        @article.destroy
      end
    end
  end
end
