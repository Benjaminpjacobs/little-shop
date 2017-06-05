class Admin::ItemController < Admin::PrivateController
  def edit

  end

  def new
    @item = Item.new
  end
end
