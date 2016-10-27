Given(/^there are (\d+) readers$/) do |nb_readers|
  nb_readers.to_i.times do
    create(:reader)
  end
end

Given(/^the "([^"]*)" reader exists$/) do |reader|
  create(reader.downcase)
end
