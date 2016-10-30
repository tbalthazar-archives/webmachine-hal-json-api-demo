module WebmachineHALJSONAPIDemo
  class Article < Sequel::Model
    include ModelHelper
    many_to_one :category
    many_to_many :readers, join_table: :accesses

    def validate
      super
      errors.add(:title, "can't be empty") if title.nil? || title.empty?
      errors.add(:link, "can't be empty") if link.nil? || link.empty?
    end
  end
end
