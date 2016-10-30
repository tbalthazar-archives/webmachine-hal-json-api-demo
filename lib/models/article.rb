module WebmachineHALJSONAPIDemo
  class Article < Sequel::Model
    many_to_one :category
  end
end
