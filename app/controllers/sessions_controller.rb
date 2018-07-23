class SessionsController < ApplicationController
  def create
    require 'pry'; binding.pry
    census_user_info = env["omniauth.auth"]
  end
end
