require 'faker'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    first_name Faker::Name.name.split[0]
    last_name Faker::Name.name.split[1]
    password "password"
    role 0
  end
end
