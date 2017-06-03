require "rails_helper"

RSpec.feature "As a user" do
  context "when viewing a retired item" do
    it "cannot add to cart" do
      user = create(:user)
      item = create(:item, status: 1)

      visit item_path(item)

      expect(page).to_not have_content("Add to Cart")
      expect(page).to have_css(".disabled")
      find_button("Item Retired", disabled: true)
    end
  end
end
