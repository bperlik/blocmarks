class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
  end

  def new
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end

end

