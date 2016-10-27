require 'sqlite3'
require 'sequel'

module WebmachineHALJSONAPIDemo
  module Database
    def self.setup
      DB.drop_table? :articles, :categories, :users

      DB.create_table :users do
        primary_key :id
        String :email, unique: true
        String :password
        String :token
      end

      DB.create_table :categories do
        primary_key :id
        String :name, unique: true
      end

      DB.create_table :articles do
        primary_key :id
        String :title
        String :link
        foreign_key :category_id, :categories
      end
    end
  end
end
