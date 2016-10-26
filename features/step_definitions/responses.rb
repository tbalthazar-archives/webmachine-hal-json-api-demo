Then(/^the response boddy should be:$/) do |body|
  assert_equal JSON.parse(body), JSON.parse(last_response.body)
end
