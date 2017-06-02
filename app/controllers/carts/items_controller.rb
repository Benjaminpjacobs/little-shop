class Carts::ItemsController < ApplicationController
  def create
    item_id = params[:item_id]
    item = Item.find(item_id)
    if params[:perform] == "remove"
      @cart.remove_item(item_id)
      flash[:remove_item_from_cart] = "Successfully removed #{view_context.link_to(item.name, item_path(item))} from your cart."
    else
      @cart.contents[item_id] = params[:quantity].to_i
    end
    redirect_to carts_path
  end
end
