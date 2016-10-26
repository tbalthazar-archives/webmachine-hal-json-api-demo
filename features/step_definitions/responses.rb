Then(/^the response body should be:$/) do |body|
  assert_equal JSON.parse(body), JSON.parse(last_response.body)
end

Then(/^the response body should be empty$/) do
  assert last_response.body.empty?
end

Then(/^the status code should be (\d+)$/) do |status|
  assert_equal status.to_i, last_response.status.to_i
end

Then(/^the body should contain a valid token$/) do
  body = JSON.parse(last_response.body)
  refute_nil body['token']
  refute_equal body['token'], ''
end

Then(/^the body should contain (\d+) categories$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
