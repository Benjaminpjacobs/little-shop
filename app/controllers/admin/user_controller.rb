class Admin::UserController < PrivateController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    if @user.save
      flash[:success] = "Admin profile updated!"
      redirect_to admin_dashboard_index_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
end