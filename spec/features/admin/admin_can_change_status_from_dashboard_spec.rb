require 'rails_helper'

RSpec.describe "As an admin", :js => true do
  it "can change statuses" do
    # admin = create(:user, role: 1)

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    # order1 = create(:order, status: 0)

    # visit admin_dashboard_index_path
    # # expect(page).not_to have_errors
    # expect(Order.where(status: "paid").count).to eq(0)
    # click_on "Ordered (1)"
    # click_on "Paid"
    # visit root_path
    # visit admin_dashboard_index_path
    # sleep(5)
    # expect(Order.where(status: "paid").count).to eq(1)
    # click_on "Cancel"

    # click_on "Cancelled (1)"
    # expect(page).to have_content(order1.user.full_name)
    

    # order2 = create(:order, status: 0)
    # visit admin_dashboard_index_path
    
    # click_on "Ordered (1)"
    # click_on "Paid"

    # click_on "Paid (1)"
    # expect(page).to have_content(order2.user.full_name)
    # click_on "Completed"

    # click_on "Completed (1)"
    # expect(page).to have_content(order2.user.full_name)
  end
end
