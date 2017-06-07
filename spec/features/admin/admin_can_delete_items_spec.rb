require 'rails_helper'

RSpec.describe "As an admin" do
  it "can delete an item" do
    admin = create(:user, role: 1)
    item = create(:item)

    visit root_path
    click_on "Login"
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "View All Items"

    click_on "Edit"

    expect(page).to have_button("Delete Item")
    click_button "Delete Item"
    expect(page).to have_content("Item Annihilated!")
    expect(current_path).to eq(admin_items_path)


  end
end

# ## Ensure model test catches negative numbers for price
