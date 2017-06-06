class Users::PasswordController < ApplicationController

  def edit
    @user = User.new
  end

  def update
    if Password.confirm_submission(password_params)
      binding.pry
      # current_user.update(password_digest: BCrypt::Password.create(password_params[:new]))
      current_user.update(password: password_params[:new])
      binding.pry
      flash[:success] = "Password Successfully Updated"
      redirect_to dashboard_index_path
    end
  end


  private

  def password_params
    params.permit(:old, :new, :confirm, :id)
  end

end
