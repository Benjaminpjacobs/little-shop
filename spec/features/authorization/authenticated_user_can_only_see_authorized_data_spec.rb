require 'rails_helper'

RSpec.feature "As an authenticated user" do
  before(:each) do 
    reset_session!
  end
  
  it "cannot view another user's data" do
    user1 = create(:user_with_orders, order_count: 1)
    order1 = user1.orders.first
    user2 = create(:user_with_orders, order_count: 1)
    order2 = user2.orders.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit orders_path

    expect(page).to_not have_content(order2.created_at)
    expect(page).to have_content(order1.created_at)

    visit dashboard_index_path
    
    expect(page).to_not have_content(user2.first_name)
    expect(page).to have_content(user1.first_name)
  end

  it "cannot view the admin screens or perform admin functions" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_index_path
    expect(page).to have_content("The page you were looking for doesn't exist")
    visit admin_orders_path
    expect(page).to have_content("The page you were looking for doesn't exist")
    visit edit_admin_item_path
    expect(page).to have_content("The page you were looking for doesn't exist")
    visit edit_admin_users_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
  