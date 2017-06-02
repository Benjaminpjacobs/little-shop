require "rails_helper"

RSpec.feature "A visitor" do
  it "can create a new account" do
    user = build(:user)

    visit root_path
    click_on "Login"
    expect(current_path).to eq(login_path)
    click_on "Create Account"

    fill_in 'Email', with: user.email
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Password', with: user.password
    click_button "Create Account"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.email)
  end
end
