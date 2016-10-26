module WebmachineHALJSONAPIDemo
  FactoryGirl.define do
    to_create(&:save)

    factory :category, class: Category do
      sequence(:name) { |n| "Category #{n}" }
    end

    factory :tech, class: Category do
      name 'Tech'
    end
  end
end
