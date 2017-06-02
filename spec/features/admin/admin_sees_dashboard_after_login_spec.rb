require 'rails_helper'

RSpec.feature "as admin" do
  before(:each) do
    reset_session!
  end
  context "it can log in" do
    xit "and can see admin dashboard" do
      admin = create(:user, role: 1)
      visit root_path
      click_on "Login"
      fill_in "Email", with: admin.email
      fill_in "Password", with: "password"
      click_button "Login"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("Welcome Admin")
    end
  end
end
