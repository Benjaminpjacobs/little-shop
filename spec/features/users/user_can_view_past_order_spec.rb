require 'rails_helper'

RSpec.feature "An existing user" do
  context "with a single order" do
    before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "can see that completed order" do
      order = @user.orders.push(create(:order_with_items, status: 4))

      visit orders_index_path

      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.order_date)

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

    xit "can see that cancelled order" do
      order = @user.orders.push(create(:order_with_items, status: 3))

      visit orders_index_path

      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.order_date)

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
