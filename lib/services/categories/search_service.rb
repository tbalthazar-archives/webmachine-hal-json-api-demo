module WebmachineHALJSONAPIDemo
  module Categories
    class SearchService
      def initialize(params)
        @params = params
      end

      def execute
        if name.nil?
          Category.all
        else
          Category.where(Sequel.ilike(:name, "%#{name}%")).to_a
        end
      end

      private

      def name
        return nil if @params.nil? ||
                      @params['name'].nil? ||
                      @params['name'].empty?
        @params['name']
      end
    end
  end
end
