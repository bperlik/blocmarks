class UsersController < ApplicationController
#  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
   @user_bookmarks = current_user.bookmarks
   @liked_bookmarks =  current_user.liked_bookmarks

  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information was updated."
      redirect_to edit_user_registration_path
    else
      flash[:error] = "An error occurred. Please try again."
      redirect_to edit_user_registration_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end

end

