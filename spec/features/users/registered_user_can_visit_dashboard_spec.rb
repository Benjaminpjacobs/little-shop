require "rails_helper"

RSpec.feature "As registered user" do
  it "can see dashboard" do

    user = create(:user_with_address)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    click_on ("#{user.first_name}")
    
    expect(current_path).to eq(dashboard_index_path)

    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.full_address)
    expect(page).to have_content(user.email)
  end
end






# Registered user can see dashboard with profile information
# And I should see a link to my dashboard
# And I should not see a link for "Login"
# And I should see a link for "Logout"
# And if I click the link to my dashboard
# And I should see my profile information
# And I should not see a link for "Login"
# And I should see a link for "Logout"