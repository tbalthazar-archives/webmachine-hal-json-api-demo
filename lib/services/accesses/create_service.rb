module WebmachineHALJSONAPIDemo
  module Accesses
    class CreateService
      def initialize(reader_id, article_id)
        @reader_id = reader_id
        @article_id = article_id
      end

      def execute
        access || Access.create(reader_id: @reader_id,
                                article_id: @article_id)
      end

      private

      def access
        Access.where(reader_id: @reader_id,
                     article_id: @article_id).first
      end
    end
  end
end
