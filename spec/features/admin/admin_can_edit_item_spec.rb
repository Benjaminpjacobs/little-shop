require "rails_helper"

RSpec.feature "As an admin" do
  xit "can edit an item" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    cat1, cat2 = create_list(:category, 2)
    item = create(:item)
    item2 = build(:item)

    visit admin_item_index_path
    click_on "Edit"

    expect(current_path).to eq(edit_admin_item_path(item))

    fill_in "Name", with: item2.name
    fill_in "Description", with: item2.description
    fill_in "Price", with: item2.price
    select "Retired", from: "Status"
    attach_file("Upload Your File", Rails.root + "spec/fixtures/images/gear1.png")
    click_on "Update Item"

    expect(current_path).to eq(admin_item_index_path)


    expect(page).to have_content(item2.name)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.price)
    expect(page).to have_content("Status: Retired")
    expect(page.all("img".count)).to eq(1)
  end
end
