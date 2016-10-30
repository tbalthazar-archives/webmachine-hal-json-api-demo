module WebmachineHALJSONAPIDemo
  FactoryGirl.define do
    to_create(&:save)

    factory :category, class: Category do
      sequence(:name) { |n| "Category #{n}" }
    end

    factory :tech, class: Category do
      name 'Tech'
    end

    factory :politics, class: Category do
      name 'Politics'
    end

    factory :architecture, class: Category do
      name 'Architecture'
    end
  end
end
