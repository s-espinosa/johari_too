class User < ApplicationRecord
  enum role: [:default, :admin]

  def self.create_from_census(census_user)
    user = User.find_by(census_id: census_user.id)
    if user
      user = user.update_census_user(user, census_user)
    else
      user = User.create_census_user(census_user)
    end
    user
  end

  def update_census_user(user, census_user)
    user.update_attributes(census_user)
    user.save
    user
  end

  def self.create_census_user(census_user)
    user = User.new
    user.update_attributes(census_user)
    user.save
    user
  end

  def update_attributes(census_user)
    self.cohort_name = census_user.cohort_name
    self.email       = census_user.email
    self.first_name  = census_user.first_name
    self.last_name   = census_user.last_name
    self.git_hub     = census_user.git_hub
    self.census_id   = census_user.id
    self.image_url   = census_user.image_url
    self.role        = "default"
    self.slack       = census_user.slack
    self.twitter     = census_user.twitter
  end
end
