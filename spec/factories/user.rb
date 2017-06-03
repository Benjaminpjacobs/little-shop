require 'faker'

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    first_name {Faker::Name.name.split[0]}
    last_name {Faker::Name.name.split[1]}
    password "password"
    role 0

    factory :user_with_address do
      after(:create) do |user|
        create(:address, user: user)
      end
    end

    factory :user_with_orders do
      after(:create) do |user|
        create(:order_with_items, user: user)
        create(:order_with_items, user: user)
        create(:order_with_items, user: user)
      end
    end
  end
end
