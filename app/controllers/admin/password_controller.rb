class Admin::PasswordController < Admin::PrivateController

  def edit
    @user = User.new
  end

  def update
    confirm = Password.confirm_submission(password_params)
    if confirm === true
      current_user.update(password: password_params[:new])
      flash[:success] = 'Password Successfully Updated'
      redirect_to dashboard_index_path
    else
      flash[:errors] = confirm
      render :edit
    end
  end

  private

  def password_params
    params.permit(:old, :new, :confirm, :id)
  end
end
