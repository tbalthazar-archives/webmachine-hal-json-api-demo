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
  end
end
