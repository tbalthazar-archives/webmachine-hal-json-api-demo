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

When(/^the client sends a valid request to create a token for Alice$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
