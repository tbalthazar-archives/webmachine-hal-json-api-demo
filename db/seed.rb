require 'sqlite3'
require 'sequel'

DB = Sequel.connect('sqlite://db/database.db')

require_relative '../app'

WebmachineHALJSONAPIDemo::User.create(email: 'alice@example.org',
                                      password: 'alice-pwd')
tech = WebmachineHALJSONAPIDemo::Category.create(name: 'Tech')
WebmachineHALJSONAPIDemo::Category.create(name: 'Architecture')
WebmachineHALJSONAPIDemo::Category.create(name: 'Culture')
linux = WebmachineHALJSONAPIDemo::Article.create(
  title: 'Linux on the desktop is a thing',
  link: 'https://example.com/tech/linux-on-the-desktop-is-a-thing',
  category_id: tech.id
)
WebmachineHALJSONAPIDemo::Article.create(
  title: 'i3, a tiling window manager',
  link: 'https://example.com/tech/i3-a-tiling-window-manager',
  category_id: tech.id
)
jane = WebmachineHALJSONAPIDemo::Reader.create(name: 'Jane', email: 'jane@example.org')
bob = WebmachineHALJSONAPIDemo::Reader.create(name: 'Bob', email: 'bob@example.org')
linux.add_reader(jane)
