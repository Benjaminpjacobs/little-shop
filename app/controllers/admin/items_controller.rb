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
      flash[:success] = "Item created!"
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "Item updated!"
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end


  private

  def item_params
    p = params.require(:item).permit(:status, :name, :description, :price, :image, :category_list)
    p[:status] = p[:status].to_i
    p
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
