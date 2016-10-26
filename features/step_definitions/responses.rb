Then(/^the response boddy should be:$/) do |body|
  assert_equal JSON.parse(body), JSON.parse(last_response.body)
end

Then(/^the status code should be (\d+)$/) do |status|
  assert_equal status.to_i, last_response.status.to_i
end

Then(/^the body should contain a valid token$/) do
  body = JSON.parse(last_response.body)
  refute_nil body['token']
  refute_equal body['token'], ''
end
