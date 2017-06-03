class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_to_cart(item.id)
    session[:cart]= @cart.contents
    redirect_back(fallback_location: carts_path)
  end

  def update
    item_id = params[:item_id]
    @cart.remove_item(item_id)
    redirect_to carts_path
  end

end
