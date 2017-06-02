class Carts::ItemsController < ApplicationController

  def edit
    @cart.contents[params[:item_id]]= params[:quantity].to_i
    flash[:updated_cart] = "Successfully updated #{view_context.link_to(item.name, item_path(item))} quantity in your cart."
    redirect_to carts_path
  end

  def destroy
    @cart.remove_item(params[:item_id])
    flash[:remove_item_from_cart] = "Successfully removed #{view_context.link_to(item.name, item_path(item))} from your cart."
    redirect_to carts_path
  end
end
