require "rails_helper"

RSpec.feature "When a visitor" do
  context "visits the items page and clicks add to cart" do
    it "the items are in the cart" do
      item1 = create(:item)

      visit items_path
      click_on "Add to Cart"
      expect(current_path).to eq(items_path)
      click_on "View Cart"
      expect(current_path).to eq(carts_path)
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item1.price)
      expect(page.all("img").count).to eq(1)
      expect(page).to have_content(item1.price)

      visit items_path
      click_on "Add to Cart"
      click_on "View Cart"
      expect(page).to have_content(item1.price*2)

    end
  end

  context "visits the category page and clicks add to cart" do
    it "the items are in the cart" do
      item1 = create(:item)
      category1 = create(:category)
      CategoryItem.create(item_id: item1.id, category_id: category1.id)

      visit category_path(item1.categories.first)
      click_on "Add to Cart"
      click_on "View Cart"

      expect(current_path).to eq(carts_path)
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item1.price)
      expect(page.all("img").count).to eq(1)
      expect(page).to have_content(item1.price)

      visit category_path(item1.categories.first)
      click_on "Add to Cart"
      click_on "View Cart"
      expect(page).to have_content(item1.price * 2)
    end
  end

  context "visits the item page and clicks add to cart" do
    it "the items are in the cart" do
      item1 = create(:item)
      visit item_path(item1)
      click_on "Add to Cart"
      click_on "View Cart"
      expect(current_path).to eq(carts_path)
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item1.price)
      expect(page.all("img").count).to eq(1)
      expect(page).to have_content(item1.price)

      visit item_path(item1)
      click_on "Add to Cart"
      click_on "View Cart"
      expect(page).to have_content(item1.price * 2)
    end
  end
end
