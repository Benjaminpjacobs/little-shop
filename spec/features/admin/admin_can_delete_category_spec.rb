require 'rails_helper'

RSpec.describe "As an admin" do
  it "can delete a category from category edit" do
    admin = create(:user, role: 1)
    category = create(:category)

    visit items_path
    click_on "Login"
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "View All Categories"

    click_on "Edit"

    expect(page).to have_button("Delete Category")
    click_button "Delete Category"
    expect(page).to have_content("Category Annihilated!")
    expect(current_path).to eq(admin_categories_path)
  end

  it "can delete a category from categories index" do
    admin = create(:user, role: 1)
    category = create(:category)

    visit items_path
    click_on "Login"
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "View All Categories"

    click_on "Delete"

    expect(page).to_not have_content(category.title)
    expect(page).to have_content("Category Annihilated!")
    expect(current_path).to eq(admin_categories_path)
  end
end
