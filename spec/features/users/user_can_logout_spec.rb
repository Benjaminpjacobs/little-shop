require 'rails_helper'

RSpec.feature "When a user is logged in" do
  before(:each) do
    reset_session!
  end

  it "can logout" do

    user = create(:user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "Logout"

    expect(page).to_not have_content("Logout")
    expect(page).to have_content("Login")
  end
end
