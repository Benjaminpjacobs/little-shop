require 'rails_helper'

RSpec.feature "As an admin" do
  it "can view individual order" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    user = create(:user_with_address)
    order1 = create(:order_with_items, user: user)
    order_item1 = order1.items.first
    order_item2 = order1.items.last

    visit admin_order_path(order1)

    expect(page).to have_content(order1.created_at)
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.full_address)

    expect(page).to have_link(order_item1.name)
    expect(page).to have_content(order_item1.price)
    expect(page).to have_content(order1.order_items.first.qty)
    expect(page).to have_content(order1.order_items.first.line_item_subtotal)

    expect(page).to have_content(order_item2.price)
    expect(page).to have_link(order_item2.name)
    expect(page).to have_content(order1.order_items.last.qty)
    expect(page).to have_content(order1.order_items.last.line_item_subtotal)
  
    expect(page).to have_content("Ordered")
    expect(page).to have_content(order1.total)
  end
end


