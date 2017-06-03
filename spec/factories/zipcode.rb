FactoryGirl.define do
  factory :zipcode do
    number {Faker::Address.zip}
  end
end

