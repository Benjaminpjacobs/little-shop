require "rails_helper"

RSpec.feature "When a visitor" do
  context "visits a category" do
    it "sees all items in that category" do
      category1 = create(:category_with_items, item_count: 2)
      item1 = category1.items.first
      item2 = category1.items.last
      category2 = create(:category_with_items, item_count: 2)
      item3 = category2.items.first
      item4 = category2.items.last


      visit category_path(category1)
      expect(find('.page-heading')).to have_content(category1.title)
      expect(page).to have_content(item1.title)
      expect(page).to have_content(item2.title)
      expect(page).to_not have_content(item3.title)
      expect(page).to_not have_content(item4.title)

      visit category_path(category2)
      expect(find('.page-heading')).to have_content(category2.title)
      expect(page).to have_content(item3.title)
      expect(page).to have_content(item4.title)
      expect(page).to_not have_content(item1.title)
      expect(page).to_not have_content(item2.title)
    end
  end
end
