require "rails_helper"

RSpec.feature "As registered user" do
  it "can add address to profile" do

    user = create(:user)
    address = build(:address)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_index_path

    click_on "Add Address"

    expect(current_path).to eq(new_users_address_path)

    fill_in "Street Address", with: address.street_address
    fill_in "City", with: address.city
    fill_in "State", with: address.state
    fill_in "Zipcode", with: address.zipcode

    click_button "Add Address"

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_content(address.street_address)
    expect(page).to have_content(address.city)
    expect(page).to have_content(address.state)
    expect(page).to have_content(address.zip)

  end
end

