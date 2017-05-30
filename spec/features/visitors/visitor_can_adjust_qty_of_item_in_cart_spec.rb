require "rails_helper"

RSpec.feature "When a visitor" do
  context "visits the cart" do
    it "he or she can raise the quantity" do
      item1 = create(:item)
      cart = Cart.new
      cart.add_item(item1.id)

      visit cart_path
      expect(page).to have_content("Qty: 1")
      expect(page).to have_content(item1.price)
      fill_in "Quantity", with: 3
      click_on "Update Cart"
      expect(page).to have_content("Qty: 3")
      expect(page).to have_content(item1.price*3)
    end

    it "he or she can raise the quantity" do
      item1 = create(:item)
      cart = Cart.new
      cart.add_item(item1.id)
      cart.add_item(item1.id)

      visit cart_path
      expect(page).to have_content("Qty: 2")
      expect(page).to have_content(item1.price*2)
      fill_in "Quantity", with: 1
      click_on "Update Cart"
      expect(page).to have_content("Qty: 1")
      expect(page).to have_content(item1.price)
    end
  end
end