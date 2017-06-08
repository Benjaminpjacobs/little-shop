class HomeController < ApplicationController

  def index
    @featured_item = Item.featured_items[rand(0..2)]
    @categories = Category.all
  end

end
