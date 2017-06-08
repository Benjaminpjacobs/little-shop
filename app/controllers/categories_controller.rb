class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(title: params[:id].capitalize)
    @items = @category.items.paginate(:page => params[:page], :per_page => 12)
  end
end