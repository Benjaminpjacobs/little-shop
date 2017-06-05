class OrdersController < PrivateController

  def index
    user = User.find(params[:user_id])
    @orders = user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = current_user.orders.create
    @order.add_items(@cart)
    session[:cart].clear
    flash[:order_success] = "Order was successfully placed."
    redirect_to user_order_path(current_user, @order)
  end

  def destroy
  end

  def edit
  end

end
