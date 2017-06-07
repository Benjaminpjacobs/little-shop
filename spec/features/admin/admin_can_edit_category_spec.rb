require 'rails_helper'

RSpec.describe "As an admin" do
  it "can edit a category" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category = create(:category)
    visit admin_categories_path

    within('.admin-categories') do
      expect(page).to have_content(category.title)
      click_on "Edit"
    end

    fill_in "Title", with: "A new name"
    click_button "Update Category"
    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("Updated: A new name!")

    expect(page).to_not have_content(category.title)
  end
end
