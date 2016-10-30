module WebmachineHALJSONAPIDemo
  class Reader < Sequel::Model
    include ModelHelper
    many_to_many :articles, join_table: :accesses
  end
end
