class WelcomeController < ApplicationController
  def show
    render layout: 'login'
  end
end
