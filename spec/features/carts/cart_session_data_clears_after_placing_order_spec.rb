require 'rails_helper'

RSpec.feature "As a user" do
  context "with a cart full of items and an address on file" do
    it "can checkout" do
      user = create(:user_with_address)
      item = create(:item)

      visit item_path(item)

      click_on "Add to Cart"
      click_on "Add to Cart"
      click_on "Add to Cart"

      visit carts_path

      within(".checkout") { click_on "Login" }
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Login"
      expect(current_path).to eq(carts_path)

      click_on "Checkout"
      click_on "View Cart"

      expect(page).to have_content("You're cart is currently empty. Why don't you add some nifty accessories!")
      expect(page).to have_link("nifty accessories", href: items_path)
    end
  end
end
