require 'webmachine'
require 'jwt'
require 'roar/json/hal'
require 'sqlite3'
require 'sequel'

# DB = Sequel.connect('sqlite://db/database.db')

require 'resources/base_resource'
require 'resources/api_resource'
require 'resources/tokens_resource'
require 'resources/categories_resource'

require 'models/user'
require 'models/category'
