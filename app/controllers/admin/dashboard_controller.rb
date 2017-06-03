class Admin::DashboardController < Admin::PrivateController

  def index
    @orders = Order.all
  end
end
