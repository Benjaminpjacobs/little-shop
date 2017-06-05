class Admin::ItemController < Admin::PrivateController

  def index
    @items = Item.all
  end

  def edit

  end

  def new
    @item = Item.new
  end
end
