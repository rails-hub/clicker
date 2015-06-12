class ApplicationController < ActionController::Base
  protect_from_forgery


  protected

  def is_admin
    redirect_to root_path unless current_user.has_role? :admin
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
  end


end
