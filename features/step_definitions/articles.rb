Given(/^there are (\d+) articles in the "([^"]*)" category$/) do |nb_articles, category|
  name = attributes_for(category.downcase)[:name]
  c = WebmachineHALJSONAPIDemo::Category.where(name: name).first
  nb_articles.to_i.times do
    create(:article, category_id: c.id)
  end
end

Given(/^the "([^"]*)" article is in the "([^"]*)" category$/) do |article, category|
  name = attributes_for(category.downcase)[:name]
  c = WebmachineHALJSONAPIDemo::Category.where(name: name).first
  c ||= create(category.downcase)
  create(article.downcase, category_id: c.id)
end
