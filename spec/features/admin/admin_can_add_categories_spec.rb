require 'rails_helper'

RSpec.describe "As an admin" do
  it "can create a category" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path
    fill_in "Title", with: "Test Category"

    click_on "Create Category"
    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("Created: Test Category")
    expect(page).to have_content("Test Category")
  end
end
