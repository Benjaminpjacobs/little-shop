class UsersController < ApplicationController

  def new
    @user = User.new
    @return_path = params[:return] if params[:return]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_later
      session[:user_id] = @user.id
      redirect_to return_params
    else
      render :new
    end
  end

  def edit
    render file: "public/404" if current_admin?
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to dashboard_index_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

  def return_params
    params.require(:user).permit(:return)[:return]
  end

end
