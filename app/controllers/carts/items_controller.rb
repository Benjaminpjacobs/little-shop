class Carts::ItemsController < ApplicationController
  before_action :set_item
  before_action :set_action
  before_action :set_quantity

  def create
    item_id = params[:item_id]
    @cart.send(@action, @item_id, @quantity)
    redirect_to carts_path
  end

  private
    
    def set_item
      @item_id = params[:item_id]
    end

    def set_action
      @action= params[:perform].to_sym
    end

    def set_quantity
      @quantity = params[:quantity].to_i
    end
end
