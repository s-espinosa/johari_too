class CensusCohort
  def self.create_from_name(name)
    cohorts     = CensusService.cohorts
    cohort_info = filter_cohorts(cohorts, name)

    if cohort_info.empty?
      nil
    else
      create_cohort_from_census(cohort_info)
    end
  end

  def self.find(id)
    cohort = TuringCohort.find(id)
    CensusCohort.new(cohort)
  end

  def self.all
    cohorts = TuringCohort.all
    cohorts.map { |cohort| CensusCohort.new(cohort) }
  end

  def initialize(cohort)
    @cohort = cohort
  end

  def users
    census_users = CensusService.users_by_cohort(self)
    census_users.map do |user|
      CensusUser.new(user)
    end
  end

  def outstanding_assignments
    outstanding_users = users.select do |user|
      user.outstanding_assignments != []
    end

    outstanding_users.map do |user|
      user.outstanding_assignments
    end.flatten
  end

  def name
    @cohort.name
  end

  def id
    @cohort.id
  end

  private
  def self.filter_cohorts(cohorts, name)
    cohorts.select do |cohort|
      cohort["name"] == name.upcase
    end
  end

  def self.create_cohort_from_census(cohort_info)
    formatted = cohort_info
                  .first
                  .except("start_date", "status")

    cohort = TuringCohort
      .where(id: formatted["id"])
      .first_or_create(formatted)
    CensusCohort.new(cohort)
  end
end
