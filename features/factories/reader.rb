module WebmachineHALJSONAPIDemo
  FactoryGirl.define do
    to_create(&:save)

    factory :reader, class: Reader do
      sequence(:name) { |n| "Reader #{n}" }
      sequence(:email) { |n| "reader#{n}@example.org" }
    end

    factory :jane, class: Reader do
      name 'Jane'
      email 'jane@example.org'
    end
  end
end
