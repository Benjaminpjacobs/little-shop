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

    # it "can see cancelled" do
    #   visit admin_dashboard_index_path
    #   click_link "Cancelled (1)"
    #   sleep(5)
    #   expect(page).to have_content("Cancelled")
    #   expect(page).to have_content("#{@order3.id}")
    # end
  end
end
