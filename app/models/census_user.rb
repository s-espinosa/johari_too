class CensusUser
  def self.create_from_census(request)
    token       = request.env['omniauth.auth']["credentials"]["token"]
    census_user = CensusService.current_user(token)
    User.where(id: census_user["id"])
        .first_or_create(id: census_user["id"])
  end

  def initialize(census_user)
    @first_name = census_user["first_name"]
    @last_name  = census_user["last_name"]
    @user       = User.where(id: census_user["id"])
                      .first_or_create(id: census_user["id"])
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def id
    @user.id
  end

  def assignments
    @user.assignments
  end
end
