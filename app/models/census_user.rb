class CensusUser
  def self.create_from_census(census_user)
    user = User.find_by(census_id: census_user["id"])
    if user
      user = update_census_user(user, census_user)
    else
      user = create_census_user(census_user)
    end
    user
  end

  def self.create_from_census_cohort(cohort)
    users = CensusService.users_by_cohort(cohort)
    users.each do |user_hash|
      user = create_from_census(user_hash)
      user.update(turing_cohort: cohort)
    end
  end

  private
  def self.update_census_user(user, census_user)
    update_attributes(user, census_user)
    user
  end

  def self.create_census_user(census_user)
    user = User.new
    update_attributes(user, census_user)
    user
  end

  def self.update_attributes(user, census_user)
    user.cohort_name = census_user["cohort"]["name"]
    user.email       = census_user["email"]
    user.first_name  = census_user["first_name"]
    user.last_name   = census_user["last_name"]
    user.git_hub     = census_user["git_hub"]
    user.census_id   = census_user["id"]
    user.image_url   = census_user["image_url"]
    user.role        = "default"
    user.slack       = census_user["slack"]
    user.twitter     = census_user["twitter"]
    user.save
  end
end
