class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.where(giver_id: current_user.id, receiver_id: params[:id]).last
  end
end
