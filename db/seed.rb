require 'sqlite3'
require 'sequel'

DB = Sequel.connect('sqlite://db/database.db')

require_relative '../app'

WebmachineHALJSONAPIDemo::User.create(email: 'alice@example.org',
                                      password: 'alice-pwd')
tech = WebmachineHALJSONAPIDemo::Category.create(name: 'Tech')
WebmachineHALJSONAPIDemo::Category.create(name: 'Culture')
WebmachineHALJSONAPIDemo::Article.create(
  title: 'Linux on the desktop is a thing',
  link: 'https://example.com/tech/linux-on-the-desktop-is-a-thing',
  category_id: tech.id
)
WebmachineHALJSONAPIDemo::Reader.create(name: 'Jane', email: 'jane@example.org')
