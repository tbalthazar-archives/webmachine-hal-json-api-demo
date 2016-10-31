module WebmachineHALJSONAPIDemo
  FactoryGirl.define do
    to_create(&:save)

    factory :article, class: Article do
      sequence(:title) { |n| "Article #{n}" }
      sequence(:link) { |n| "https://example.org/article/#{n}" }
    end

    factory 'linux on the desktop is a thing', class: Article do
      title 'Linux on the desktop is a thing'
      link 'https://example.org/tech/linux-on-the-desktop-is-a-thing'
    end

    factory 'beautiful desktop wallpapers', class: Article do
      title 'Beautiful desktop wallpapers'
      link 'https://example.org/tech/beautiful-desktop-wallpapers'
    end

    factory 'everything in the terminal', class: Article do
      title 'Everything in the terminal'
      link 'https://example.org/tech/everything in the terminal'
    end
  end
end
