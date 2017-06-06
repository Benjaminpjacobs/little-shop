require "rails_helper"

RSpec.feature "As registered user" do
  it "can edit profile" do

    user = create(:user_with_address)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    click_on ("#{user.first_name}")

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_link("Edit Profile")
    click_on "Edit Profile"
    expect(current_path).to eq(edit_user_path(user))

    expect(page).to have_content("Edit Profile")
    expect(page).to have_selector("input[value='#{user.first_name}']")
    expect(page).to have_selector("input[value='#{user.last_name}']")
    expect(page).to have_selector("input[value='#{user.email}']")

    fill_in "First name", with: "Peach"
    fill_in "Last name", with: "Cobbler"
    fill_in "Email", with: "buttercrust@ilovebutter.com"

    click_on "Update Profile"
    expect(current_path).to eq(dashboard_index_path)
  end

end
