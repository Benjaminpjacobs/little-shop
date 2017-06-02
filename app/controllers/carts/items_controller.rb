class Carts::ItemsController < ApplicationController

  def edit
    flash[:updated_cart] = "Successfully updated #{view_context.link_to(item.name, item_path(item))} quantity in your cart."
  end

  def destroy
    flash[:remove_item_from_cart] = "Successfully removed #{view_context.link_to(item.name, item_path(item))} from your cart."
  end
end
