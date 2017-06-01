FactoryGirl.define do
  factory :item do
    name
    description
    price
    image_file_name { 'test.png' }
    image_content_type { 'image/png' }
    image_file_size { 1024 }
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
