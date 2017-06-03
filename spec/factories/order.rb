FactoryGirl.define do
  factory :order do
    user

    factory :order_with_items do
      after(:create) do |order|
        item1 = create(:item)
        item2 = create(:item)
        item3 = create(:item)

        order.order_items.create(item_id: item1.id, qty: 3)
        order.order_items.create(item_id: item2.id, qty: 1)
        order.order_items.create(item_id: item3.id, qty: 1)
      end
    end
  end
end
