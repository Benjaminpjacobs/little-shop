class Admin::OrderController < Admin::PrivateController

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.find(params[:id])
    @order.update(status: Order.status_code[@status])
    redirect_to admin_order_path(@order)
  end

end
