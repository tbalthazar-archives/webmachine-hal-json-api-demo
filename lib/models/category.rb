module WebmachineHALJSONAPIDemo
  class Category < Sequel::Model
    include ModelHelper
    one_to_many :articles
    plugin :validation_helpers

    def validate
      super
      validates_unique :name
      validates_presence :name
    end
  end
end
