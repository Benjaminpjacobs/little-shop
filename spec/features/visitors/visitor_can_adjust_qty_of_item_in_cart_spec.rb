require "rails_helper"

RSpec.feature "When a visitor" do
  context "visits the cart" do
    before(:each) do
      @item1 = create(:item)
      visit item_path(@item1)
      click_on "Add to Cart"
    end

    it "he or she can raise the quantity" do
      visit carts_path

      expect(find_field("quantity").value).to eq("1")
      expect(page).to have_content(@item1.price)

      fill_in "quantity", with: 3
      click_on "Update Quantity"

      expect(find_field("quantity").value).to eq("3")
      expect(page).to have_content(@item1.price*3)
    end

    it "he or she can raise the quantity" do
      click_on "Add to Cart"
      visit carts_path

      expect(find_field("quantity").value).to eq("2")
      expect(page).to have_content(@item1.price*2)

      fill_in "quantity", with: 1
      click_on "Update Quantity"

      expect(find_field("quantity").value).to eq("1")
      expect(page).to have_content(@item1.price)
    end
  end
end