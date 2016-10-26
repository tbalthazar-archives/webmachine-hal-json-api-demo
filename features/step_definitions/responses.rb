Then(/^the response boddy should be:$/) do |body|
  assert_equal body, last_response.body
end
