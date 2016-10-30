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
  refute_nil body['_embedded']
  assert_equal nb_categories.to_i, body['_embedded']['categories'].count
end

Then(/^the body should contain the "([^"]*)" category$/) do |category|
  c = find_category_with_fixture_name(category)
  body = JSON.parse(last_response.body)
  assert_equal c.id, body['id']
  assert_equal c.name, body['name']
end

Then(/^the body should contain the "([^"]*)" category in the list$/) do |category|
  c = find_category_with_fixture_name(category)
  body = JSON.parse(last_response.body)
  refute_nil body['_embedded']
  refute_nil body['_embedded']['categories']
  assert_equal c.id, body['_embedded']['categories'].first['id']
  assert_equal c.name, body['_embedded']['categories'].first['name']
end

Then(/^the body should contain the "([^"]*)" article$/) do |article|
  a = find_article_with_fixture_name(article)
  body = JSON.parse(last_response.body)
  assert_equal a.id, body['id']
  assert_equal a.title, body['title']
  assert_equal a.link, body['link']
end

Then(/^the body should contain (\d+) articles$/) do |nb_articles|
  body = JSON.parse(last_response.body)
  refute_nil body['_embedded']
  assert_equal nb_articles.to_i, body['_embedded']['articles'].count
end

Then(/^the body should contain (\d+) readers$/) do |nb_readers|
  body = JSON.parse(last_response.body)
  refute_nil body['_embedded']
  assert_equal nb_readers.to_i, body['_embedded']['readers'].count
end

Then(/^the body should contain the "([^"]*)" reader$/) do |reader|
  r = find_reader_with_fixture_name(reader)
  body = JSON.parse(last_response.body)
  assert_equal r.id, body['id']
  assert_equal r.name, body['name']
  assert_equal r.email, body['email']
end

Then(/^the body should contain an error for the "([^"]*)" field$/) do |field|
  body = JSON.parse(last_response.body)
  assert body['message'].include?(field)
end
