require 'rails_helper'

RSpec.feature "As an unauthenticated user" do
  before(:each) do 
    reset_session!
  end
  xit "cannot view a user's private data" do
    visit orders_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  xit "cannot view administrator screens or make self administrator" do
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
