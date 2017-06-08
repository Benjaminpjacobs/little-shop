require "rails_helper"

RSpec.feature "A guest" do
  context "as a registered user" do
    it "can see dashboard" do
      user = create(:user_with_address)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit items_path
      click_on ("#{user.first_name}")

      expect(current_path).to eq(dashboard_index_path)

      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
      expect(page).to have_content(user.full_name)
      expect(page).to have_content(user.full_address)
      expect(page).to have_content(user.email)
    end
  end

  context "as a guest user" do
    it "cannot see dashboard" do
      visit dashboard_index_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
