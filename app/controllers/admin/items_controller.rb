class Admin::ItemsController < Admin::PrivateController

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "Item updated!"
      redirect_to admin_item_path(@item)
    else
      flash[:error] = @item.errors.full_messages
      render :edit
    end
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
      flash[:error] = @item.errors.full_messages
      render :new
    end
  end

  def show
    @item= Item.find(params[:id])
  end

  private

  def item_params
    p = params.require(:item).permit(:status, :name, :description, :price, :image, :category_list)
    p[:status] = p[:status].to_i
    p
  end
end
