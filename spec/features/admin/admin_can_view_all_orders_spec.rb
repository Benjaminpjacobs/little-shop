require 'rails_helper'

RSpec.describe "As an admin", js: true do
  context "sees all orders separated by status" do
    # before(:each) do
    #   @admin = create(:user, role: 1)

    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    #   @order1 = create(:order, status: 0)
    #   @order6 = create(:order, status: 0)
    #   @order2 = create(:order, status: 1)
    #   @order3 = create(:order, status: 2)
    #   @order4 = create(:order, status: 3)
    #   @order5 = create(:order, status: 3)
    # end

    # it "can see tags and ordered" do 
    #   visit admin_dashboard_index_path
    #   expect(page).to have_content("Ordered (2)")
    #   expect(page).to have_content("Paid (1)")
    #   expect(page).to have_content("Cancelled (1)")
    #   expect(page).to have_content("Completed (2)")

    #   click_link "Ordered (2)"
    #   sleep(5)
    #   expect(page).to have_content("Ordered")
    #   expect(page).to have_content("#{@order1.id}")
    #   expect(page).to have_content("#{@order6.id}")
    #   expect(page).to have_link("Cancel")
    #   expect(page).to have_link("Paid")
    # end

  end
end

