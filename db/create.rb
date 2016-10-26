require 'sqlite3'
require 'sequel'

require_relative './schema'

DB = Sequel.connect('sqlite://db/database.db')
WebmachineHALJSONAPIDemo::Database.setup
