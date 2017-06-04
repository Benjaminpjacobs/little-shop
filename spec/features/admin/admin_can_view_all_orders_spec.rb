require 'rails_helper'

RSpec.feature "As an admin" do
  it "sees all orders separated by status" do

    admin = create(:user, role: 1)
<<<<<<< HEAD
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    order1 = create(:order, status: 0)
    order6 = create(:order, status: 0)
    order2 = create(:order, status: 1)
    order3 = create(:order, status: 2)
    order4 = create(:order, status: 3)
    order5 = create(:order, status: 3)
=======
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_respond(admin)

    order1 = create(:order, status: 0)
    order2 = create(:order, status: 1)
    order3 = create(:order, status: 2)
    order4 = create(:order, status: 3)
>>>>>>> 4ba9836d4be7aec76a2ceb80d76ee90043d1f5fc

    visit admin_dashboard_index_path

    page.should have_content("Ordered: 2")
    page.should have_content("Paid: 1")
    page.should have_content("Cancelled: 1")
    page.should have_content("Completed: 2")

    within('.orders-table.ordered') do
      page.should have_content("Ordered")
      page.should have_link("#{order1.id}", href:user_order_path(order1.user, order1))
      page.should have_link("#{order6.id}", href:user_order_path(order6.user, order6))
      page.should have_button("Cancel")
      page.should have_button("Paid")
    end

    within('.orders-table.paid') do
      page.should have_content("Paid")
      page.should have_link("#{order2.id}", href:user_order_path(order2.user, order2))
      page.should have_button("Cancel")
      page.should have_button("Completed")
    end

    within('.orders-table.cancelled') do
      page.should have_content("Cancelled")
      page.should have_link("#{order3.id}", href:user_order_path(order3.user, order3))
    end

    within('.orders-table.completed') do
      page.should have_content("Completed")
      page.should have_link("#{order4.id}", href:user_order_path(order4.user, order4))
      page.should have_link("#{order5.id}", href:user_order_path(order5.user, order5))
    end
  end

  it "can filter through all order statuses" do
    
  end
end
