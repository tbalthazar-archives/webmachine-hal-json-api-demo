require 'sqlite3'
require 'sequel'

module WebmachineHALJSONAPIDemo
  module Database
    def self.setup
      DB.drop_table? :accesses, :articles, :categories, :users, :readers

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

      DB.create_table :readers do
        primary_key :id
        String :name
        String :email, unique: true
      end

      DB.create_table :accesses do
        primary_key :id
        foreign_key :reader_id, :readers
        foreign_key :article_id, :articles
        unique [:reader_id, :article_id]
      end
    end
  end
end
