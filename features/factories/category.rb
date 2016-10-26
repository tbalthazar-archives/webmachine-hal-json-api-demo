module WebmachineHALJSONAPIDemo
  FactoryGirl.define do
    to_create(&:save)

    factory :category, class: Category do
      sequence(:name) { |n| "Category #{n}" }
    end
  end
end
