module WebmachineHALJSONAPIDemo
  class Category < Sequel::Model
    one_to_many :articles
    plugin :validation_helpers

    def next
      Category.where('id > ?', id).order(:id).first
    end

    def previous
      Category.where('id < ?', id).order(Sequel.desc(:id)).first
    end

    def validate
      super
      validates_unique :name
      validates_presence :name
    end
  end
end
