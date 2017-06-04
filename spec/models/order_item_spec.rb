require 'rails_helper'

RSpec.describe OrderItem do
  context "validations" do
    it {should belong_to(:order)}
    it {should belong_to(:item)}
    it {should validate_presence_of(:qty)}
    # it {should validate_presence_of(:line_item_subtotal)}
  end
  
  it "should calculate line item subtotal" do
    order = create(:order)
    item = create(:item)
    order_item = order.order_items.create!(item_id: item.id, order_id: order.id, qty: 1)
    expect(order_item.line_item_subtotal).to eq(item.price)

    order_item = order.order_items.create(item_id: item.id, order_id: order.id, qty: 2)
    expect(order_item.line_item_subtotal).to eq(item.price * 2)
  end

end
