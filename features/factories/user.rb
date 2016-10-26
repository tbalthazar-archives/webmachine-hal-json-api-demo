module WebmachineHALJSONAPIDemo
  FactoryGirl.define do
    to_create(&:save)

    factory :alice, class: User do
      email 'alice@example.org'
      password 'alice-pwd'
      token 'alice-token'
    end
  end
end
