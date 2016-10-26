Then(/^the response boddy should be:$/) do |body|
  assert_equal JSON.parse(body), JSON.parse(last_response.body)
end

Then(/^the status code should be (\d+)$/) do |status|
  assert_equal status.to_i, last_response.status.to_i
end

Then(/^the body should be a valid token$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
