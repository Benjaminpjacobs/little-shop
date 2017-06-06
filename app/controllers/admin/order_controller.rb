class Admin::OrderController < Admin::PrivateController

  def show
    @order = Order.find(params[:id])
  end

end
