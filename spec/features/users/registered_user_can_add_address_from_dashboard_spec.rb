require "rails_helper"

RSpec.feature "As registered user" do
  it "can add address to profile" do
    user = create(:user)
    address = build(:address)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_index_path

    click_on "Add Address"

    expect(current_path).to eq(new_users_address_path)

    fill_in "Street address", with: address.street_address
    fill_in "address[city_attributes][name]", with: address.city.name
    fill_in "address[state_attributes][name]", with: address.state.name
    fill_in "address[zipcode_attributes][number]", with: address.zipcode.number
    select "Home", from: "Address type"

    click_button "Save Address"

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_content(address.street_address)
    expect(page).to have_content(address.city.name)
    expect(page).to have_content(address.state.name)
    expect(page).to have_content(address.zipcode.number)
  end

  it "cannot leave blank fields" do
    user = create(:user)
    address = build(:address)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_index_path

    click_on "Add Address"

    expect(current_path).to eq(new_users_address_path)

    click_button "Save Address"
    expect(page).to have_content("Street address can't be blank")
    expect(page).to have_content("City name can't be blank")
    expect(page).to have_content("State name can't be blank")
    expect(page).to have_content("Zipcode must exist")
  end
end
