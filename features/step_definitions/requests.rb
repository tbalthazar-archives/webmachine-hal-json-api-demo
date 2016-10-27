When(/^the client provides valid media type headers$/) do
  header 'Accept', 'application/hal+json'
  header 'Content-Type', 'application/hal+json'
end

When(/^the client provides invalid media type headers$/) do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

Given(/^the client is signed in as "([^"]*)"$/) do |user|
  u = create(user.downcase)
  header 'Authorization', "Bearer #{u.token}" unless u.nil?
end

Given(/^the client not signed in$/) do
  header 'Authorization', nil
end

When(/^the client sends a GET request to the root URL$/) do
  get '/'
end

When(/^the client sends a valid request to create a token for "([^"]*)"$/) do |user|
  u = build(user.downcase)
  post '/tokens', {
    email: u.email,
    password: u.password
  }.to_json
end

When(/^the client sends a request to create a token for "([^"]*)" with a wrong password$/) do |user|
  u = build(user.downcase)
  post '/tokens', {
    email: u.email,
    password: u.password + 'wrong'
  }.to_json
end

When(/^the client sends a request to create a token for a user that does not exist$/) do
  post '/tokens', {
    email: 'doesnotexist@example.org',
    password: 'doesnotexist-pwd'
  }.to_json
end

When(/^the client sends a request to list categories$/) do
  get '/categories'
end

When(/^the client sends a request to get the "([^"]*)" category$/) do |category|
  name = attributes_for(category.downcase)[:name]
  c = WebmachineHALJSONAPIDemo::Category.where(name: name).first

  get "/categories/#{c.id}"
end

When(/^the client sends a request to get a category that does not exist$/) do
  max_id = DB[:categories].max(:id)
  max_id = max_id.nil? ? 1 : max_id + 1
  get "/categories/#{max_id}"
end

When(/^the client sends a request to get the "([^"]*)" article$/) do |article|
  title = attributes_for(article.downcase)[:title]
  a = WebmachineHALJSONAPIDemo::Article.where(title: title).first
  get "/articles/#{a.id}"
end

When(/^the client sends a request to list articles in the "([^"]*)" category$/) do |category|
  name = attributes_for(category.downcase)[:name]
  c = WebmachineHALJSONAPIDemo::Category.where(name: name).first
  get "/categories/#{c.id}/articles"
end

When(/^the client sends a request to create an article in the "([^"]*)" category$/) do |category|
  name = attributes_for(category.downcase)[:name]
  c = WebmachineHALJSONAPIDemo::Category.where(name: name).first
  post "/categories/#{c.id}/articles", {
    title: 'Linux on the desktop is a thing',
    link: 'https://example.org/tech/linux-on-the-desktop-is-a-thing'
  }.to_json
end

When(/^the client sends a request to list readers$/) do
  get '/readers'
end

When(/^the client sends a request to grant "([^"]*)" access to "([^"]*)"$/) do |reader, article|
  email = attributes_for(reader.downcase)[:email]
  r = WebmachineHALJSONAPIDemo::Reader.where(email: email).first
  title = attributes_for(article.downcase)[:title]
  a = WebmachineHALJSONAPIDemo::Article.where(title: title).first
  post "/articles/#{a.id}/access", {
    reader_id: r.id
  }.to_json
end
