class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_index_path
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    render file: "public/404" if current_admin?
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
