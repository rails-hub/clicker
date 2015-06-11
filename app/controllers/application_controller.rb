class ApplicationController < ActionController::Base
  protect_from_forgery


  def is_admin
    redirect_to root_path unless current_user.has_role? :admin
  end
end
