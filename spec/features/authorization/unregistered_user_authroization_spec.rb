require 'rails_helper'

RSpec.feature "As an unauthenticated user" do
  before(:each) do 
    reset_session!
  end

  it "cannot view a user's private data" do
    user = create(:user)
    visit user_orders_path(user)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  it "cannot view administrator screens or make self administrator" do
    item = create(:item)
    visit admin_dashboard_index_path
    expect(page).to have_content("The page you were looking for doesn't exist")
    visit admin_order_index_path
    expect(page).to have_content("The page you were looking for doesn't exist")
    visit edit_admin_item_path(item)
    expect(page).to have_content("The page you were looking for doesn't exist")
    visit admin_user_index_path
    expect(page).to have_content("The page you were looking for doesn't exist") 
  end
end
