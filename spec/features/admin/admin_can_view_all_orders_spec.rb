require 'rails_helper'

RSpec.feature "As an admin" do
  it "sees all orders separated by status" do

    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    order1 = create(:order, status: 0)
    order2 = create(:order, status: 1)
    order3 = create(:order, status: 2)
    order4 = create(:order, status: 3)
    order5 = create(:order, status: 3)

    visit admin_dashboard_index_path

    within('.ordered') do
      save_and_open_page
      page.should have_content("Ordered : 1")
      page.should have_content("Ordered")
      page.should have_link("View Order", href:user_order(order1))
      page.should have_content("Cancel")
      page.should have_content("Paid")
    end

    within('.paid') do
      page.should have_content("Paid : 1")
      page.should have_content("Ordered")
      page.should have_link("View Order", href:user_order(order2))
      page.should have_content("Cancel")
      page.should have_content("Completed")
    end

    within('.cancelled') do
      page.should have_content("Cancelled : 1")
      page.should have_content("Ordered")
      page.should have_link("View Order", href:user_order(order3))
    end

    within('.completed') do
      page.should have_content("Completed : 2")
      page.should have_content("Ordered")
      page.should have_link("View Order", href:user_order(order4))
      page.should have_link("View Order", href:user_order(order5))
    end
  end

  it "can filter through all order statuses" do

  end
end
