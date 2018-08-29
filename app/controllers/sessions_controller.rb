class SessionsController < ApplicationController
  def create
    token       = request.env['omniauth.auth']["credentials"]["token"]
    census_user = CensusService.current_user(token)
    user        = CensusUser.create_from_census(census_user)
    session[:user_id] = user.id
    redirect_to user_dashboard
  end
end
