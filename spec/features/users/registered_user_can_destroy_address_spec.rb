require 'rails_helper'

RSpec.feature "As registered user" do
  it "can delete address on profile" do

    user = create(:user_with_address)
    user_address = user.addresses.first
    address = build(:address)

    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit dashboard_index_path
    click_on "Edit Address"

    expect(current_path).to eq(edit_users_address_path(user_address))

    click_on "Delete Address"

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to_not have_content(address.street_address)
    expect(page).to_not have_content(address.city.name)
    expect(page).to_not have_content(address.state.name)
    expect(page).to_not have_content(address.zipcode.number)
    expect(page).to_not have_content("Home")
    expect(page).to_not have_content("Billing")
    expect(page).to have_content("Successfully Deleted Address!")
  end
end
