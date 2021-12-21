class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :destroy]

    def show
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        redirect_to user_path(params[:id])
      else
        render :edit
      end
    end
  
    def destroy
      @user.destroy
      redirect_to root_path()
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email)
    end
end
