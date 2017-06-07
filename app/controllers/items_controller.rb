class ItemsController < ApplicationController
  def index
    if params[:search]
      @items = Item.search(params[:search]).paginate(:page => params[:page], :per_page => 12)
      @items = [@items, "Search results for #{params[:search]}"]
    else
      @items = Item.paginate(:page => params[:page], :per_page => 12)
      @items = [@items, "All Items"]
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end
