When(/^the client provides valid media type headers$/) do
  header 'Accept', 'application/hal+json'
  header 'Content-Type', 'application/hal+json'
end

When(/^the client provides invalid media type headers$/) do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
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
