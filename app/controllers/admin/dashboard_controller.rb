class Admin::DashboardController < Admin::PrivateController
  include DashboardHelper

  def index
    @orders = Order.all
  end


end
