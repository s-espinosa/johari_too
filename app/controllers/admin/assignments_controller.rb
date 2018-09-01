class Admin::AssignmentsController < Admin::BaseController
  def create
    Assignment.create_multiple(params["students"])
    @cohort = TuringCohort.find(params[:cohort_id])
    flash[:success] = "Assignments successfully created."
    redirect_to admin_cohort_path(@cohort)
  end
end
