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
      redirect_to params[:session][:return_path]
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

end
