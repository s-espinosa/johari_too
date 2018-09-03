class SessionsController < ApplicationController
  def create
    user = CensusUser.create_from_census(request)
    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
