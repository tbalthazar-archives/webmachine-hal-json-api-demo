require 'sqlite3'
require 'sequel'

module Database
  def self.setup
    DB.drop_table? :users
    DB.create_table :users do
      primary_key :id
      String :email, unique: true
      String :password
      String :token
    end
  end
end
