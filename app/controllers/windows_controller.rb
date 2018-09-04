class WindowsController < ApplicationController
  def show
    @window = Window.new(current_user)
  end
end
