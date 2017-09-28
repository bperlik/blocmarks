class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  #  handling user unauthorized actions
  #rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def handle_error
    redirect_to root_url
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end

