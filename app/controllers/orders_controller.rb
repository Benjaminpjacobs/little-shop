class OrdersController < PrivateController
  def index
    user = User.find(params[:user_id])
    @orders = user.orders
  end

  def show
    @order = Order.find(params[:id])
  end
end