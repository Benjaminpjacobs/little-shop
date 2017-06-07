class Admin::DashboardController < Admin::PrivateController
  before_action :set_code, only: [:update]

  def index
    @count = Order.status_count
    if params.keys.include?("retrieve")
      @orders = Order.retrieve(params.keys[1])
      @count = Order.status_count
    end
  end

  def update
    @order = Order.find(params[:id])  
    @order.update(status: Order.status_code[@status])
    redirect_to admin_dashboard_index_path
  end
  
  def set_code
    @status = params[:perform].to_sym
  end
end
