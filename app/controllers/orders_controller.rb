class OrdersController < PrivateController

  def index
    user = User.find(params[:user_id])
    @orders = user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    if current_user.addresses.empty?
      redirect_to new_users_address_path(:current_path => request.path)
    else
      @order = current_user.orders.create
      @order.add_items(@cart)
      session[:cart].clear
      flash[:order_success] = "Order was successfully placed."
      redirect_to user_order_path(current_user, @order)
    end
    
  end

  def destroy
  end

  def edit
  end

end
