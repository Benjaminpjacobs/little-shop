class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @items = @category.items.paginate(:page => params[:page], :per_page => 4)
  end

end
