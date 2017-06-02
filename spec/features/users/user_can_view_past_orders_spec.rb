require 'rails_helper'

RSpec.feature "An existing user" do
  context "with multiple orders" do
    xit "can see them on the orders page" do
      user = User.create(:user_with_orders, order_count: 3)
      order1 = user.orders[0]
      order2 = user.orders[1]
      order3 = user.orders[3]
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit orders_index_path

      expect(page).to have_content(order1.total)
      expect(page).to have_content(order1.order_date)
      expect(page).to have_content(order2.total)
      expect(page).to have_content(order2.order_date)
      expect(page).to have_content(order3.total)
      expect(page).to have_content(order4.order_date)
      
    end
  end
end
 


# Background: An existing user that has multiple orders

# As an Authenticated User
# When I visit "/orders"
# Then I should see all orders belonging to me and no other orders