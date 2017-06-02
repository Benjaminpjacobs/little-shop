class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.update_quantity(item.id)
    session[:cart]= @cart.contents
    flash[:add_item_to_cart] = "Successfully added #{view_context.link_to(item.name, item_path(item))} to your cart."
    redirect_back(fallback_location: carts_path)
  end

  # def update
  #   binding.pry

  #   @cart.remove_item(params[:item_id])
  #   redirect_to carts_path
  # end

  def update
    binding.pry
    item_id = params[:item_id]
    @cart.remove_item(item_id)
    redirect_to carts_path
  end


  # def show
  #   @cart
  # end
end

# def destroy
#    item_id = params[:item_id]
#    flash[:notice] = “Successfully removed #{view_context.link_to(Item.find(item_id).title, item_path(item_id))} from cart!”
#    @cart.delete(item_id)
#    redirect_to cart_path
#  end
