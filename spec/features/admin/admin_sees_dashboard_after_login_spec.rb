require 'rails_helper'

RSpec.feature "as admin" do
  context "it can log in" do
  it "and can see admin dashboard" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit root_path
    click_on "Login"
    fill_in "email", with: admin.email
    fill_in "password", with: password
    click_on "Login"

    expect(current_path)to eq(admin_dashboard_index_path)
    expect(page).to have_content("Welcome Admin")
  end
end
