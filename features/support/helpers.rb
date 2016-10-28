def find_category_with_fixture_name(fixture_name)
  name = attributes_for(fixture_name.downcase)[:name]
  WebmachineHALJSONAPIDemo::Category.where(name: name).first
end

def find_article_with_fixture_name(fixture_name)
  title = attributes_for(fixture_name.downcase)[:title]
  WebmachineHALJSONAPIDemo::Article.where(title: title).first
end

def find_reader_with_fixture_name(fixture_name)
  email = attributes_for(fixture_name.downcase)[:email]
  WebmachineHALJSONAPIDemo::Reader.where(email: email).first
end
