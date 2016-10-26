Given(/^the user "([^"]*)" exists$/) do |user|
  u = user.downcase
  User.create(email: "#{u}@example.org", password: "#{u}-pwd")
end
