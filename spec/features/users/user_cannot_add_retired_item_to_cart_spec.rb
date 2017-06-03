require "rails_helper"

RSpec.feature "As a user" do
  context "when viewing a retired item" do
    it "cannot add to cart" do
      user = user(:create)
      item = item(:create, status: 1)

      visit item_path(item)

      expect(page).to_not have_content("Add to Cart")
      expect(page).to have_content("Item Retired")
    end
  end
end
