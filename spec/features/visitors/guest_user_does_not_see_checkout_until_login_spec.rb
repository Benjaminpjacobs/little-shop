require 'rails_helper'

RSpec.feature "When a visitor" do
  context "has items in cart" do
    it "doesn't see checkout until logged in" do
      user = build(:user)
      item1 = create(:item)

      visit item_path(item1)

      click_on "Add to Cart"
      visit carts_path
      expect(page).to_not have_content("Checkout")
      expect(page).to have_link("Login")
      expect(page).to have_content(item1.name)
      click_on "Create Account"

      fill_in :email, with: user.email
      fill_in :first_name, with: user.first_name
      fill_in :last_name, with: user.last_name
      fill_in :password, with: "password"
      click_button "Create Account"

      visit carts_path
      expect(page).to have_content(item1.name)
      expect(page).to have_content("Checkout")
    end
  end
end
