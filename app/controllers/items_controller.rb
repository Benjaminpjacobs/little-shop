class ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @item = Item.find(params[:id])
  end
end
