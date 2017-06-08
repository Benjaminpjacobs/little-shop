class Admin::CategoriesController < Admin::PrivateController
  before_action :set_category, only: [:update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "Created: #{@category.title}"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Updated: #{@category.title}!"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Category Annihilated!'
    redirect_to admin_categories_path
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

    def set_category
      @category = Category.find_by(title: params[:id].capitalize)
    end
end