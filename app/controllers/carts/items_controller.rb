class Carts::ItemsController < ApplicationController
  def create
    item_id = params[:item_id]
    @cart.remove_item(item_id)
    redirect_to carts_path
  end
end
