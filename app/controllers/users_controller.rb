class UsersController < ApplicationController

  def new
    @user = User.new
    @address = Address.new
  end
end
