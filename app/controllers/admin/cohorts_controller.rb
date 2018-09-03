class Admin::CohortsController < Admin::BaseController
  def index
    @cohorts = CensusCohort.all
  end

  def show
    @cohort = CensusCohort.find(params[:id])
  end

  def create
    @cohort = CensusCohort.create_from_name(params[:cohort_name])
    if @cohort
      flash[:success] = "Successfully added #{@cohort.name}"
      redirect_to admin_cohorts_path
    else
      flash[:error] = "Sorry. Something went wrong. Check to see if the cohort you are trying to create exists on Census and is spelled correctly."
      redirect_to admin_cohorts_path
    end
  end
end
