require 'rails_helper'

RSpec.feature "As an admin" do
  it "sees all orders separated by status" do

    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    order1 = create(:order, status: 0)
    order2 = create(:order, status: 1)
    order3 = create(:order, status: 2)
    order4 = create(:order, status: 3)

    visit admin_dashboard_index_path

    within('.ordered') do
      page.should have_content("Ordered")
      page.should have_content(order1.user)
      page.should have_content("Cancel")
      page.should have_content("Paid")
    end

    within('.paid') do
      page.should have_content("Ordered")
      page.should have_content(order2.user)
      page.should have_content("Cancel")
      page.should have_content("Completed")
    end

    within('.cancelled') do
      page.should have_content("Ordered")
      page.should have_content(order3.user)
    end

    within('.completed') do
      page.should have_content("Ordered")
      page.should have_content(order4.user)
    end
  end
end
