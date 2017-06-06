class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_to_cart(item.id)
    session[:cart]= @cart.contents
    flash[:add_item_to_cart] = "Successfully added item to your #{view_context.link_to("cart", carts_path)} (#{@cart.total_count})."
    redirect_back(fallback_location: items_path)
  end

  def update
    item_id = params[:item_id]
    @cart.remove_item(item_id)
    redirect_back(fallback_location: items_path)
  end

  def index
  end

end
