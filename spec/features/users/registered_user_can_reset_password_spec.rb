require "rails_helper"

RSpec.feature "As registered user" do
  it "can edit password" do

    user = create(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit dashboard_index_path

    click_on "Reset Password"
    expect(current_path).to eq(edit_user_password_path(user))

    fill_in "Old password", with: "password"
    fill_in "New password", with: "pass"
    fill_in "Confirm new password", with: "pass"

    click_button "Update Password"

    expect(page).to have_content("Password Successfully Updated")

    click_on "Logout"

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "pass"
    click_button "Login"

    expect(page).to have_content(user.first_name)
  end

  it "needs old password to reset" do
    user = create(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit dashboard_index_path

    click_on "Reset Password"
    expect(current_path).to eq(edit_user_password_path(user))

    fill_in "New password", with: "pass"
    fill_in "Confirm new password", with: "pass"

    click_button "Update Password"

    expect(page).to have_content("Invalid Password")
    expect(current_path).to eq(edit_user_password_path(user))

    fill_in "Old password", with: "password"
    fill_in "New password", with: "pass"

    click_button "Update Password"
    expect(page).to have_content("Passwords Do Not Match")
    expect(current_path).to eq(edit_user_password_path(user))
  end
end
