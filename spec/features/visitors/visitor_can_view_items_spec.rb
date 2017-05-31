require "rails_helper"

RSpec.feature "When a visitor" do
  it "visits the items page" do
    item1, item2, item3 = create_list(:item, 3)
    visit items_path
    save_and_open_page
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
    expect(page).to have_xpath("//img[@src='spec/fixtures/images/gear.png'")
    expect(page).to have_content(item2.name)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.price)
    expect(page).to have_xpath("//img[@src='spec/fixtures/images/gear.png'")
    expect(page).to have_content(item3.name)
    expect(page).to have_content(item3.description)
    expect(page).to have_content(item3.price)
    expect(page).to have_xpath("//img[@src='spec/fixtures/images/gear.png'")
    expect(page).to have_content("Login")
  end
end
