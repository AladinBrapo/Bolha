module Admin
  class UsersController < Admin::ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "User deleted successfully."
    end

    def promote
      @user = User.find(params[:id])
      @user.update(admin: true)
      redirect_to admin_users_path, notice: "User promoted to admin."
    end

    private

    def require_admin
      redirect_to root_path, alert: "Not authorized" unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:email, :admin)
    end
  end
end
