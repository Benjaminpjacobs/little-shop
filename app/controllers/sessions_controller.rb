class SessionsController < ApplicationController

  def new
    @return_path = params[:current_path]
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Logged in as #{@user.first_name}"
      redirect_to return_path
    else
      flash[:login_error] = "The email or password you entered is invalid"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def return_path
    if current_guest == "admin"
      admin_dashboard_index_path
    else
      params[:session][:return_path]
    end
  end

end
