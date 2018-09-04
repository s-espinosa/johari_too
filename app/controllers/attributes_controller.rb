class AttributesController < ApplicationController
  def create
    assignment = Assignment.find(params[:assignment_id])
    Attribute.create_multiple(assignment, params[:adjectives])
    flash[:success] = "Attributes successfully submitted."
    redirect_to dashboard_path
  end
end
