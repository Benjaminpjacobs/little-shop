require 'rails_helper'

RSpec.feature "as admin" do
  before(:all) do
    reset_session!
    @admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  
  it "can modify admin account" do
    visit admin_dashboard_path
    click_on "Edit"
    fill_in "email", with: "ed@example.com"
    click_button "Update Profile"
    
    expect(page).to have_content("ed@example.com")
    expect(page).to_not have_content(@admin.email)
  end
  
  it "can see but not modify users account" do
    user = create(:user)
    visit admin_users_path
    expect(page).to_not have_content("Edit")
    expect(page).to_not have_link(edit_admin_user_path(user))
    expect(page).to_not have_link(edit_user_path(user))
  end
end

