require "rails_helper"

RSpec.feature "When a visitor" do
  context "visits the cart" do
    it "they can delete an item" do
      item1 = create(:item)

      visit item_path(item1)
      click_on "Add to Cart"

      visit carts_path
      click_on "Remove"
      save_and_open_page
      expect(current_path).to eq(carts_path)
      expect(page).to have_content("Successfully removed #{item1.name} from your cart")
      #capybara test color flash message or partial should be green
      expect(page).to have_link("#{item1.name}", :href=>item_path(item1))
      expect(page.find(".cart")).to_not have_content(item1.name)
    end
  end
end
