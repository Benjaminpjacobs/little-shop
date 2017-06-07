require 'rails_helper'

RSpec.describe "As an admin", js: true do
  context "sees all orders separated by status" do
    # before(:each) do
    #   @admin = create(:user, role: 1)

    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    #   @order2 = create(:order, status: 1)
    #   @order3 = create(:order, status: 2)
    #   @order4 = create(:order, status: 3)
    #   @order5 = create(:order, status: 3)
    # end
    # it "can see paid" do
    #   visit admin_dashboard_index_path
    #   expect(page).to have_content("Paid (1)")
    #   click_on "Paid (1)"
    #   sleep(5)
    #   expect(page).to have_content("Paid")
    #   expect(page).to have_content("#{@order2.id}")
    #   expect(page).to have_link("Cancel")
    #   expect(page).to have_link("Completed")
    # end
  end
end