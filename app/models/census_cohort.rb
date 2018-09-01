class CensusCohort
  def self.create_from_name(name)
    cohorts = CensusService.cohorts
    cohort_info = cohorts.select do |cohort|
      cohort["name"] == name.upcase
    end

    if cohort_info.empty?
      nil
    else
      formatted = cohort_info.first.except("start_date", "status")
      formatted["census_id"] = formatted.delete("id")
      cohort = TuringCohort.where(census_id: formatted["census_id"]).first_or_create(formatted)
      CensusUser.create_from_census_cohort(cohort)

      cohort
    end
  end
end
