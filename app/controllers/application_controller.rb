class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private 
  def logged_in_user
    unless logged_in?
      flash[:danger] = t "controllers.admin.flash.danger"
      redirect_to login_url
    end
  end

  def verify_admin
    unless current_user.is_admin?
      flash[:danger] = t "controllers.admin.users.flash.danger"
      redirect_to login_url
    end
  end
end
