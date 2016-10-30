module WebmachineHALJSONAPIDemo
  class Article < Sequel::Model
    many_to_one :category
    many_to_many :readers, join_table: :accesses

    def next
      Article.where('category_id  = ? AND id > ?', category_id, id)
             .order(:id)
             .first
    end

    def previous
      Article.where('category_id = ? AND id < ?', category_id, id)
             .order(Sequel.desc(:id))
             .first
    end
  end
end
