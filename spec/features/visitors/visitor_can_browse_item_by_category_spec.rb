require "rails_helper"

RSpec.feature "When a visitor" do
  context "visits a category" do
    it "sees all items in that category" do
      category1 = create(:category)
      item1, item2 = create_list(:item, 2)
      category1.items.push(item1, item2)
      category2 = create(:category)
      item3, item4 = create_list(:item, 2)
      category2.items.push(item3, item4)


      visit category_path(category1)
      expect(find('.page-heading')).to have_content(category1.title)
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item2.name)
      expect(page).to_not have_content(item3.name)
      expect(page).to_not have_content(item4.name)

      visit category_path(category2)
      expect(find('.page-heading')).to have_content(category2.title)
      expect(page).to have_content(item3.name)
      expect(page).to have_content(item4.name)
      expect(page).to_not have_content(item1.name)
      expect(page).to_not have_content(item2.name)
    end
  end
end
