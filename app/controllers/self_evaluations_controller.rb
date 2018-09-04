class SelfEvaluationsController < ApplicationController
  def new
    @assignment = Assignment.new(giver_id: current_user.id,
                                 receiver_id: current_user.id)
  end

  def create
    assignment = Assignment.create(giver_id: current_user.id,
                                   receiver_id: current_user.id)
    Attribute.create_multiple(assignment, params[:adjectives])
    flash[:success] = "Successfully completed self-evaluation"
    redirect_to dashboard_path
  end
end
