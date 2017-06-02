class Cart::ItemController < ApplicationController
  before_action :set_item
  def update
    
    @cart.contents[@item.id.to_s] = params[:quantity].to_i
    flash[:updated_cart] = "Successfully updated #{view_context.link_to(@item.name, item_path(@item))} quantity in your cart."
    redirect_to carts_path
  end

  def destroy
    @cart.remove_item(@item.id)
    flash[:remove_item_from_cart] = "Successfully removed #{view_context.link_to(@item.name, item_path(@item))} from your cart."
    redirect_to carts_path
  end

  private
    def set_item
      @item = Item.find(params[:item_id])
    end
end
