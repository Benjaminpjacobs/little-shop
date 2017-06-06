require 'rails_helper'

RSpec.feature "as admin" do
  before(:each) do
    reset_session!
    @admin = create(:user, role: 1)
    visit login_path
    fill_in "Email", with: @admin.email
    fill_in "Password", with: "password"
    click_button "Login"
  end

  it "can modify admin account" do

    visit admin_dashboard_index_path
    click_on "Edit"
    fill_in "Email", with: "ed@example.com"
    click_button "Update Profile"
    expect(page).to have_content("ed@example.com")
    expect(page).to_not have_content(@admin.email)
  end

  it "can see but not modify users account" do
    user = create(:user)
    visit admin_user_index_path

    expect(page).to_not have_content("Edit")
    expect(page).to_not have_link(edit_admin_user_path(user))
    expect(page).to_not have_link(edit_user_path(user))

    visit edit_user_path(user)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
