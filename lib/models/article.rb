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

    def validate
      super
      errors.add(:title, "can't be empty") if title.nil? || title.empty?
      errors.add(:link, "can't be empty") if link.nil? || link.empty?
    end
  end
end
