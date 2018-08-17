class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_dashboard
    admin_dashboard_path if current_user.admin?
    dashboard_path
  end
end
