module WebmachineHALJSONAPIDemo
  class Category < Sequel::Model
    def next
      Category.where('id > ?', id).order(:id).first
    end

    def previous
      Category.where('id < ?', id).order(Sequel.desc(:id)).first
    end
  end
end
