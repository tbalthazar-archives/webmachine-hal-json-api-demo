module WebmachineHALJSONAPIDemo
  class Reader < Sequel::Model
    include ModelHelper
    many_to_many :articles, join_table: :accesses
    plugin :validation_helpers

    def validate
      super
      validates_presence :name
      validates_unique :email
      validates_presence :email
    end
  end
end
