class Admin::OrderController < Admin::PrivateController

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.find(params[:id])
    @order.update(status: Order.status_code[@status])
    redirect_to admin_order_path(@order)
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end
  
  private
  
    def order_params
      params.require(:order)[:status] = params.require(:order)[:status].to_i
      params.require(:order).permit(:status)
    end
end