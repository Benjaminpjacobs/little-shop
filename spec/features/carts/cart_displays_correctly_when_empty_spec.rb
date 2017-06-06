require 'rails_helper'

RSpec.feature "When cart is viewed" do
  context "and cart is empty" do
    it "displays proper message" do
      visit carts_path

      expect(page).to have_content("Your cart is currently empty. Why don't you add some nifty accessories?")
      expect(page).to have_link("nifty accessories", href: items_path)
    end
  end
end
