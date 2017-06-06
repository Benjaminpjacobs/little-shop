class Admin::DashboardController < Admin::PrivateController

  def index
    @orders = Order.admin_orders
  end


end
