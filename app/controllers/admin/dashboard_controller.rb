class Admin::DashboardController < Admin::PrivateController

  def index
    @orders = Order.admin_orders
  end

  def create
    @order = Order.find(params[:id])
    @order.update(status: status[params[:perform].to_sym])
    redirect_to admin_dashboard_index_path
  end

private

  def status
    {
      'paid': 1,
      'cancel': 2,
      'completed': 3,
    }

    
  end
end
