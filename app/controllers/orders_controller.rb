class OrdersController < PrivateController
  
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    if current_user.addresses.empty?
      redirect_to new_users_address_path(:return => return_path)
    else
      @order = current_user.orders.create
      @order.add_items(@cart)
      
      OrderMailer.order_confirmation(current_user, @order).deliver_later

      session[:cart].clear
      flash[:order_success] = "Order was successfully placed."

      redirect_to user_order_path(current_user, @order)
    end
  end

  def return_path
    params.require(:order).permit(:return)[:return]
  end
end