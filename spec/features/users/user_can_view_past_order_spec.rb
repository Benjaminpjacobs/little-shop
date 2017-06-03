require 'rails_helper'

RSpec.feature "An existing user" do
  context "with a single order" do

    it "can see that completed order" do
      order = create(:order_with_items, status: 3, completed_date: DateTime.now)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(order.user)
      item1 = order.items[0]
      item2 = order.items[1]
      item3 = order.items[2]

      visit user_orders_path(order.user)

      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.created_at)

      click_on "View Order"
      expect(page).to have_content(order.status)
      expect(page).to have_content(item1.name)
      expect(page).to have_content(order.order_items.find_by(item_id: item1.id).qty)
      expect(page).to have_content(order.line_item_subtotal(item1.id))
      expect(page).to have_link("#{item1.name}", :href=>item_path(item1))
      expect(page).to have_content(item2.name)
      expect(page).to have_content(order.order_items.find_by(item_id: item2.id).qty)
      expect(page).to have_content(order.line_item_subtotal(item2.id))
      expect(page).to have_link("#{item2.name}", :href=>item_path(item2))
      expect(page).to have_content("Order Completed on #{order.completed_date.to_date} at #{order.completed_date.time}")
    end

    xit "can see that cancelled order" do
      order = create(:order_with_items)

      visit orders_index_path

      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.created_at)

      click_on "View Order"
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.items[0].item)
      expect(page).to have_content(order.items[0].qty)
      expect(page).to have_content(order.items[0].line_item_subtotal)
      expect(page).to have_link(item_path(order.items[0].item))
      expect(page).to have_content(order.items[1].item)
      expect(page).to have_content(order.items[1].qty)
      expect(page).to have_content(order.items[1].line_item_subtotal)
      expect(page).to have_link(item_path(order.items[1].item))
      expect(page).to have_content("Order Completed on #{order.cancelled_date.date} at #{order.cancelled_date.time}")
    end
  end
end
