class Admin::AssignmentsController < Admin::BaseController
  def index
    @cohort = CensusCohort.find(params[:cohort_id])
  end

  def create
    Assignment.create_multiple(params["students"])
    @cohort = TuringCohort.find(params[:cohort_id])
    flash[:success] = "Assignments successfully created."
    redirect_to admin_cohort_path(@cohort)
  end

  def destroy
    flash[:success] = "Successfully deleted assignment."
    Assignment.destroy(params[:id])
    @cohort = CensusCohort.find(params[:cohort_id])
    redirect_to admin_cohort_assignments_path(@cohort.id)
  end
end
