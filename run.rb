require 'sqlite3'
require 'sequel'

DB = Sequel.connect('sqlite://db/database.db')

require_relative './app'

App.run
