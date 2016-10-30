module WebmachineHALJSONAPIDemo
  class Reader < Sequel::Model
    many_to_many :articles, join_table: :accesses
  end
end
