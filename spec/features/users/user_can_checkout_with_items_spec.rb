require 'rails_helper'

RSpec.feature "As a user" do
  context "with a cart full of items and an address on file" do
    xit "can checkout" do
      user = create(:user_with_address)
      item = create(:item)

      visit item_path(item1)

      click "Add to Cart"
      click "Add to Cart"
      click "Add to Cart"

      visit carts_path

      click_on "Login"

      fill_in "Email", with: user.email
      fill_in "First name", with: user.first_name
      fill_in "Last name", with: user.last_name
      fill_in "Password", with: "password"

      click_button "Login"

      visit carts_path
      click_on "Checkout"

      expect(current_path).to eq(orders_path)
      expect(page).to have_content("Order was successfully placed")
      expect(page).to have_content(item.name)
      expect(page).to have_content(item.price * 3)
      expect(page).to have_content("Qty: 3")
    end
  end

  context "without an address on file" do
    xit "can fill out address, then checkout" do
      user = create(:user)
      address = build(:address)
      item = create(:item)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit item_path(item1)

      click "Add to Cart"
      click "Add to Cart"
      click "Add to Cart"
      visit carts_path
      click_on "Checkout"

      expect(current_path).to eq(new_address_path)
      expect(page).to have_content("Please add an address to complete you're order")

      fill_in "Street address", with: address.street_address
      fill_in "City", with: address.city
      fill_in "State", with: address.state
      fill_in "zip", with: address.zip

      click_on "Save Address"

      expect(current_path).to eq(orders_path)
      expect(page).to have_content("Order was successfully placed")
      expect(page).to have_content(item.name)
      expect(page).to have_content(item.price * 3)
      expect(page).to have_content("Qty: 3")
    end
  end
end

