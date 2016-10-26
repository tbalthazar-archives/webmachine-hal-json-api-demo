require 'sqlite3'
require 'sequel'

module WebmachineHALJSONAPIDemo
  module Database
    def self.setup
      DB.drop_table? :users
      DB.create_table :users do
        primary_key :id
        String :email, unique: true
        String :password
        String :token
      end

      DB.drop_table? :categories
      DB.create_table :categories do
        primary_key :id
        String :name, unique: true
      end
    end
  end
end
