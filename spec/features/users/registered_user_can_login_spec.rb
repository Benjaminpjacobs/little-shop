require "rails_helper"

RSpec.feature "As registered user" do
  before(:all) do
    reset_session!
  end

  it "can login" do

    user = create(:user)

    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Logged in as #{user.first_name}")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
  end

  it "has sad path" do
    user = create(:user)

    visit root_path
    click_on "Login"
    click_button "Login"

    expect(page).to have_content("The email or password you entered is invalid")
    expect(current_path).to eq(login_path)
  end

end
