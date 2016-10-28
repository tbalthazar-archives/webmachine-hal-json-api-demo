Given(/^"([^"]*)" has access to the "([^"]*)" article$/) do |reader, article|
  r = find_reader_with_fixture_name(reader)
  a = find_article_with_fixture_name(article)
  WebmachineHALJSONAPIDemo::Access.create(reader_id: r.id, article_id: a.id)
end
