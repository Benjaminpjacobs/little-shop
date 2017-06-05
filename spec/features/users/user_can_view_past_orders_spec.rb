require 'rails_helper'

RSpec.feature "An existing user" do
  context "with multiple orders" do
    it "can see them on the orders page" do

      user = create(:user_with_orders)
      order1 = user.orders[0]
      order2 = user.orders[1]
      order3 = user.orders[2]
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_orders_path(user)

      expect(page).to have_content(order1.total)
      expect(page).to have_content(order1.created_at)
      expect(page).to have_content(order2.total)
      expect(page).to have_content(order2.created_at)
      expect(page).to have_content(order3.total)
      expect(page).to have_content(order3.created_at)
    end
  end

  context "with no orders" do
    it "sees appropriately formated page with no orders" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_orders_path(user)
      expect(page).to have_content("Hey #{user.first_name.capitalize}, we noticed you haven't placed any orders with us.")
      expect(page).to have_link("rad items", href: items_path)
      
    end
  end
  
end
