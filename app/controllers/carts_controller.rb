class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.update_quantity(item.id)
    session[:cart]= @cart.contents
    redirect_back(fallback_location: carts_path)
  end

  def delete
  end
  
  def index
  end
end
