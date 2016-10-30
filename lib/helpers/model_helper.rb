module WebmachineHALJSONAPIDemo
  module ModelHelper
    def self.included(base)
      base.extend ClassMethods
    end

    def next
      self.class.where('id > ?', id).order(:id).first
    end

    def previous
      self.class.where('id < ?', id).order(Sequel.desc(:id)).first
    end

    module ClassMethods
      def next_id
        # TODO: not the best way to really determine the next id.
        # Try to look for sequence:
        # https://stackoverflow.com/questions/107005/predict-next-auto-inserted-row-id-sqlite#5301923
        DB[table_name].max(:id)
      end
    end
  end
end
