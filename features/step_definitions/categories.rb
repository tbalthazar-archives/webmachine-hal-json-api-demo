Given(/^(\d+) categories exist$/) do |nb_cat|
  nb_cat.to_i.times do
    create(:category)
  end
end
