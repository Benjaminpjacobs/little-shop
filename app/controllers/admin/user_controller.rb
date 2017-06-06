class Admin::UserController < Admin::PrivateController
  before_action :set_user, only: [:edit, :update]
  def index
    @users = User.all
  end
  
  def edit
  end

  def update
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
    
    def set_user
      @user = User.find(current_user.id)
    end
end