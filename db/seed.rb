require 'sqlite3'
require 'sequel'

DB = Sequel.connect('sqlite://db/database.db')

require_relative '../app'

WebmachineHALJSONAPIDemo::User.create(email: 'alice@example.org', password: 'alice-pwd')
WebmachineHALJSONAPIDemo::Category.create(name: 'Tech')
WebmachineHALJSONAPIDemo::Category.create(name: 'Culture')
