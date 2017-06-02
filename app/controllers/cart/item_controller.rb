class Cart::ItemController < ApplicationController
  # before_action :set_item
  # before_action :set_action
  # before_action :set_quantity

  # def create
  #   binding.pry
  #   item_id = params[:item_id]
  #   @cart.send(@action, @item_id, @quantity)
  #   redirect_to carts_path
  # end

  def edit
    @cart.contents[params[:item_id]] = params[:quantity].to_i
    redirect_to carts_path
  end

  def destroy
     @cart.remove_item(params[:item_id])
     redirect_to carts_path
  end
end
