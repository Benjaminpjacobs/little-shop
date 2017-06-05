class Admin::ItemsController < Admin::PrivateController
  def edit

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    params.require(:item).permit(:name, :description, :price, :image, :category_list)
  end
end
