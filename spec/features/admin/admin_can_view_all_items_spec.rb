require 'rails_helper'

RSpec.feature "As an admin" do
  xit "can view all items" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_respond(admin)
    item1 = create(:item)
    item2 = create(:item, status: 1)

    visit admin_dashboard_index_path

    click_on "View All Items"

    expect(current_path).to eq(admin_item_index_path)
    expect(page.all("tr").count).to eq(2)
    expect(page.all("img".count).to eq(2)
    expect(page).to have_link(item1.name, href: item_path(item1))
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
    expect(page).to have_content("Status: Available")
    expect(page).to have_link("Edit", href: edit_item_path(item1))
  
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.price)
    expect(page).to have_content("Status: Retired")
    expect(page).to have_link("Edit", href: edit_item_path(item2))
  end
end
