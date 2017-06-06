class Admin::DashboardController < Admin::PrivateController
  before_action :set_code , only: [:create]

  def index
    @orders = Order.admin_orders
  end

  def create
    @order = Order.find(params[:id])
    @order.update(status: Order.status_code[@status])
    redirect_to admin_dashboard_index_path
  end

  def set_code
    @status = params[:perform].to_sym
  end
end
