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

Then(/^the body should contain (\d+) categories$/) do |nb_categories|
  body = JSON.parse(last_response.body)
  refute_nil body['_links']
  assert_equal nb_categories.to_i, body['_links']['categories'].count
end
