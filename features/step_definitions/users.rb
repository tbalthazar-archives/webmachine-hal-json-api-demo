Given(/^the user "([^"]*)" exists$/) do |user|
  create(user.downcase)
end
