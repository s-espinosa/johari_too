class Admin::CohortsController < Admin::BaseController
  def show
    @cohort = Cohort.find(params[:id])
  end
end
