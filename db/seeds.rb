Item.destroy_all
Category.destroy_all

5.times do
  Category.create!(title: Faker::Commerce.unique.department(1))
end

50.times do
  item = Item.create!(name: Faker::Commerce.unique.product_name, price: Faker::Commerce.price, description: "Item description here.", image: File.new("#{Rails.root}/app/assets/images/gear.png"))
  item.categories << Category.all.sample
end
