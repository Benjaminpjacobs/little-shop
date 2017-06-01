require "rails_helper"

RSpec.feature "A visitor" do
  it "can create a new account" do
    user = build(:user)
    address = build(:address)

    visit root_path
    click_on "Login"
    expect(current_path).to eq(login_path)

    click_on "Create Account"
    fill_in :email, with: user.email
    fill_in :first_name, with: user.first_name
    fill_in :last_name, with: user.last_name
    fill_in :password, with: user.password
    fill_in :street_address, with: address.street_address
    fill_in :city, with: address.city.name
    fill_in :state, with: address.state.name
    fill_in :zipcode, with: address.zipcode.number
    click_button "Create Account"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.full_address)
    expect(page).to have_content(user.email)
  end
end

