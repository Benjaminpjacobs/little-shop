class Admin::ItemsController < Admin::PrivateController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = 'Item created!'
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      flash[:success] = 'Item updated!'
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:success] = 'Item Annihilated!'
    redirect_to admin_items_path
  end

  private

    def item_params
      params.require(:item)[:status] = params.require(:item)[:status].to_i 
      params.require(:item).permit(:status, :name, :description, :price, :image, :category_list)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end