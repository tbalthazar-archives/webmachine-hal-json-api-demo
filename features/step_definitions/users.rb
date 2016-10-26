Given(/^the user "([^"]*)" exists$/) do |user|
  User.create(email: 'alice@example.org', password: 'alice-pwd') 
end
