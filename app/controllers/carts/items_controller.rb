class Carts::ItemsController < ApplicationController
  def create
    item_id = params[:item_id]
    if params[:perform] == "remove"
      @cart.remove_item(item_id)
    else
      @cart.contents[item_id] = params[:quantity].to_i
    end
    redirect_to carts_path
  end
end
