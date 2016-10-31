module WebmachineHALJSONAPIDemo
  module Articles
    class SearchService
      def initialize(params)
        @params = params
      end

      def execute
        if title.nil?
          Article.all
        else
          Article.where(Sequel.ilike(:title, "%#{title}%")).to_a
        end
      end

      private

      def title
        return nil if @params.nil? ||
                      @params['title'].nil? ||
                      @params['title'].empty?
        @params['title']
      end
    end
  end
end
