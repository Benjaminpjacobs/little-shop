require 'rails_helper'

RSpec.feature "As an admin" do
  it "can view individual order"
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_respond(admin)
    user = create(:user_with_address)
    order1 = create(:order_with_items, user: user)
    order_item1 = order1.items.first
    order_item2 = order1.items.last


    visit admin_order_path(order1)

    expect(page).to have_content(order1.created_at)
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.full_address)
    expect(page).to have_content(order_item1.item.name)
    expect(page).to have_content(order_item1.item.price)
    expect(page).to have_link(item_path(order_item1.item)
    expect(page).to have_content(order_item1.qty)
    expect(page).to have_content(order_item1.line_item_subtotal)
    expect(page).to have_content(order_item2.item.name)
    expect(page).to have_content(order_item2.item.price)
    expect(page).to have_link(item_path(order_item2.item)
    expect(page).to have_content(order_item2.qty)
    expect(page).to have_content(order_item2.line_item_subtotal)
    expect(page).to have_content("Status: Ordered")
    expect(page).to have_content(order1.total)
  end
end
