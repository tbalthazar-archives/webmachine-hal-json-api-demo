module WebmachineHALJSONAPIDemo
  module Accesses
    class DeleteService
      def initialize(reader_id, article_id)
        @reader_id = reader_id
        @article_id = article_id
      end

      def execute
        access.destroy
      end

      private

      def access
        Access.where(reader_id: @reader_id,
                     article_id: @article_id).first
      end
    end
  end
end
