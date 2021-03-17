class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fullname, :cover_photo, :avatar_photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :fullname, :cover_photo, :avatar_photo])
  end
end
