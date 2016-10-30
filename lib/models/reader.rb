module WebmachineHALJSONAPIDemo
  class Reader < Sequel::Model
    many_to_many :articles, join_table: :accesses

    def next
      Reader.where('id > ?', id).order(:id).first
    end

    def previous
      Reader.where('id < ?', id).order(Sequel.desc(:id)).first
    end
  end
end
