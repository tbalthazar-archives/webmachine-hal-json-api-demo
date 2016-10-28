Given(/^there are (\d+) articles in the "([^"]*)" category$/) do |nb_articles, category|
  c = find_category_with_fixture_name(category)
  nb_articles.to_i.times do
    create(:article, category_id: c.id)
  end
end

Given(/^the "([^"]*)" article is in the "([^"]*)" category$/) do |article, category|
  c = find_category_with_fixture_name(category)
  c ||= create(category.downcase)
  create(article.downcase, category_id: c.id)
end
