module WebmachineHALJSONAPIDemo
  class Category < Sequel::Model
    one_to_many :articles

    def next
      Category.where('id > ?', id).order(:id).first
    end

    def previous
      Category.where('id < ?', id).order(Sequel.desc(:id)).first
    end
  end
end
