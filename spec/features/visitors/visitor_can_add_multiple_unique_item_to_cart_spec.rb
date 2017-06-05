require "rails_helper"

RSpec.feature "When a visitor" do
  context "visits the items page and clicks add to cart on two items" do
    it "the unique items are in the cart" do
      item1 = create(:item)
      item2 = create(:item)
      total = item1.price + item2.price
      visit item_path(item1)
      click_on "Add to Cart"

      visit item_path(item2)
      click_on "Add to Cart"

      click_on "View Cart"

      expect(current_path).to eq(carts_path)
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item1.price)
      expect(page.all("img").count).to eq(2)

      expect(page).to have_content(item2.name)
      expect(page).to have_content(item2.description)
      expect(page).to have_content(item2.price)
      expect(page).to have_content(total)
    end
  end
end
