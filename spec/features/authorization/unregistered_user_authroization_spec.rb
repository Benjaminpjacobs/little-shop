require 'rails_helper'

RSpec.feature "As an unauthenticated user" do
  before(:each) do 
    reset_session!
  end
  it "cannot view a user's private data"
    visit orders_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  it "cannot view administrator screens or make self administrator"
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










Background: An unauthenticated user and their abilities

As an Unauthenticated User
I cannot view another user's private data, such as current order, etc.
I should be redirected to login/create account when I try to check out.
I cannot view the administrator screens or use administrator functionality.
I cannot make myself an administrator.