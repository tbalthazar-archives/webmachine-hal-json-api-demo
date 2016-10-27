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

Then(/^the body should contain the "([^"]*)" category$/) do |category|
  name = attributes_for(category.downcase)[:name]
  c = WebmachineHALJSONAPIDemo::Category.where(name: name).first
  body = JSON.parse(last_response.body)
  assert_equal c.id, body['id']
  assert_equal c.name, body['name']
end

Then(/^the body should contain the "([^"]*)" article$/) do |article|
  title = attributes_for(article.downcase)[:title]
  a = WebmachineHALJSONAPIDemo::Article.where(title: title).first
  body = JSON.parse(last_response.body)
  assert_equal a.id, body['id']
  assert_equal a.title, body['title']
  assert_equal a.link, body['link']
end

Then(/^the body should contain (\d+) articles$/) do |nb_articles|
  body = JSON.parse(last_response.body)
  assert_equal nb_articles.to_i, body['articles'].count
end

Then(/^the body should contain (\d+) readers$/) do |nb_readers|
  body = JSON.parse(last_response.body)
  assert_equal nb_readers.to_i, body['readers'].count
end
