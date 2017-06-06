require 'rails_helper'

RSpec.describe "As an admin" do
  before(:each) do 
    @admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    @cat1, @cat2 = create_list(:category, 2)
    @item = build(:item)
  end
  
  it "can create an item" do

    visit new_admin_item_path
    fill_in "Name", with: @item.name
    fill_in "Description", with: @item.description
    fill_in "Price", with: @item.price
    select @cat1.title
    select @cat2.title
    attach_file "item[image]", "spec/fixtures/images/gear.png"
    click_on "Create Item"

    expect(page).to have_content(@item.name)
    expect(page).to have_content(@item.description)
    expect(page).to have_content(@item.price)
    expect(page).to have_content(@cat1.title)
    expect(page).to have_content(@cat2.title)
    expect(page).to have_content(@cat2.title)
    expect(page.all("img").count).to eq(2)
  end

  it "can creates an item with default photo" do

    visit new_admin_item_path

    fill_in "Name", with: @item.name
    fill_in "Description", with: @item.description
    fill_in "Price", with: @item.price
    select @cat1.title
    select @cat2.title
    click_on "Create Item"

    expect(page).to have_content(@item.name)
    expect(page).to have_content(@item.description)
    expect(page).to have_content(@item.price)
    expect(page).to have_content(@cat1.title)
    expect(page).to have_content(@cat2.title)
    expect(page).to have_content(@cat2.title)
    expect(page.all("img").count).to eq(2)
  end

  it "cannot create an item without title, description, or price" do

    visit new_admin_item_path

    click_on "Create Item"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end