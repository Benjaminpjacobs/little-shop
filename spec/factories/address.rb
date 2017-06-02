FactoryGirl.define do
  factory :address do
    street_address Faker::Address.street_address
    zipcode
    city
    state
    user
  end
end

  
