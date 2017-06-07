Item.destroy_all
Category.destroy_all

apparel = Category.create!(title: "Apparel")
weaponry = Category.create!(title: "Weaponry")
transport = Category.create!(title: "Transport")
supplies = Category.create!(title: "Supplies")

admin = User.create(email: "d@d.com", first_name: "Don", last_name: "Quixote", password: "password", role: 1)
user = User.create(email: "s@p.com", first_name: "Sancho", last_name: "Panza", password: "password", role: 0)

24.times do |n|
  apparel.items << Item.create!(name: Faker::Commerce.unique.product_name, price: Faker::Commerce.price, description: Faker::Hipster.paragraph, image: File.new("#{Rails.root}/app/assets/images/apparel/apparel#{(n + 1).to_s.rjust(3, "0")}.png"))
end

24.times do |n|
  weaponry.items << Item.create!(name: Faker::Commerce.unique.product_name, price: Faker::Commerce.price, description: Faker::Hipster.paragraph, image: File.new("#{Rails.root}/app/assets/images/weaponry/weaponry#{(n + 1).to_s.rjust(3, "0")}.png"))
end

24.times do |n|
  transport.items << Item.create!(name: Faker::Commerce.unique.product_name, price: Faker::Commerce.price, description: Faker::Hipster.paragraph, image: File.new("#{Rails.root}/app/assets/images/personal_transport/personal_transport#{(n + 1).to_s.rjust(3, "0")}.png"))
end

24.times do |n|
  supplies.items << Item.create!(name: Faker::Commerce.unique.product_name, price: Faker::Commerce.price, description: Faker::Hipster.paragraph, image: File.new("#{Rails.root}/app/assets/images/supplies/supplies#{(n + 1).to_s.rjust(3, "0")}.png"))
end
# 50.times do
#   item = Item.create!(name: Faker::Commerce.unique.product_name, price: Faker::Commerce.price, description: Faker::Hipster.paragraph, image: File.new("#{Rails.root}/app/assets/images/gear.png"))
#   item.categories << Category.all.sample
# end

10.times do |order|
  user.orders.create(status: "ordered")
  user.orders.create(status: "paid", paid_date: Time.at(rand * Time.now.to_i).to_date )
  user.orders.create(status: "cancelled", cancelled_date: Time.at(rand * Time.now.to_i).to_date )
  user.orders.create(status: "completed", completed_date: Time.at(rand * Time.now.to_i).to_date )
end
