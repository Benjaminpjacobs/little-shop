require "rails_helper"

RSpec.feature "As admin" do
  it "can edit password" do

    admin = create(:user, role: 1)

    visit login_path

    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit admin_dashboard_index_path

    click_on "Edit"
    expect(current_path).to eq(edit_admin_user_path(admin))

    click_on "Reset Password"
    expect(current_path).to eq(edit_admin_password_path(admin))

    fill_in "Old password", with: "password"
    fill_in "New password", with: "pass"
    fill_in "Confirm new password", with: "pass"

    click_button "Update Password"

    expect(page).to have_content("Password Successfully Updated")

    click_on "Logout"

    visit login_path

    fill_in "Email", with: admin.email
    fill_in "Password", with: "pass"
    click_button "Login"

    expect(page).to have_content(admin.first_name)
  end

  it "needs old password to reset" do
    admin = create(:user, role: 1)

    visit login_path

    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit admin_dashboard_index_path

    click_on "Edit"
    expect(current_path).to eq(edit_admin_user_path(admin))

    click_on "Reset Password"
    expect(current_path).to eq(edit_admin_password_path(admin))

    fill_in "New password", with: "pass"
    fill_in "Confirm new password", with: "pass"

    click_button "Update Password"

    expect(page).to have_content("Invalid Password")
    expect(current_path).to eq(edit_admin_password_path(admin))

    fill_in "Old password", with: "password"
    fill_in "New password", with: "pass"

    click_button "Update Password"
    expect(page).to have_content("Passwords Do Not Match")
    expect(current_path).to eq(edit_admin_password_path(admin))
  end
end
