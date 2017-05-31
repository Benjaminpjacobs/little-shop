FactoryGirl.define do
  factory :item do
    name
    description
    price
    image  { File.new(Rails.root.join('spec', 'fixtures', 'images', 'gear.png')) }
  end

  sequence :name do |n|
    "item #{n}"
  end

  sequence :description do |n|
    "item #{n}"
  end

  sequence :price do |n|
    n
  end
end
