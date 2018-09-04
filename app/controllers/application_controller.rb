class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_nav, :current_user

  def current_user
    @current_user ||= CensusUser.new(CensusService.find_user(session[:user_id])) if session[:user_id]
  end

  def user_nav
    if current_user.admin?
      'shared/admin_nav'
    else
      'shared/default_nav'
    end
  end
end
