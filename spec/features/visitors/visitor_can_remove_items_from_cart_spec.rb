require "rails_helper"

RSpec.feature "When a visitor" do
  context "visits the cart" do
    it "he or she can delete an item" do
      item1 = create(:item)
      cart = Cart.new
      cart.add_item(item1.id)

      visit cart_path
      click_on "Remove"
      expect(current_path).to eq('/cart')
      expect(page).to have_content("Successfully removed #{item1.name} from your cart")
      #capybara test color
      expect(page).to have_link(item_path(item1))
      expect(page.find(".cart")).to_not have_content(item1.name)
    end
  end
end

