class CensusService
  def self.current_user(token)
    response = conn.get do |req|
      req.url '/api/v1/user_credentials'
      req.params['access_token'] = token
    end
    JSON.parse(response.body)
  end

  def self.cohorts
    response = conn.get do |req|
      req.url '/api/v1/cohorts'
      req.params['access_token'] = token
    end
    JSON.parse(response.body)
  end

  def self.users_by_cohort(cohort)
    response = conn.get do |req|
      req.url '/api/v1/users/by_cohort'
      req.params['access_token'] = token
      req.params['cohort_id'] = cohort.id
    end
    JSON.parse(response.body)
  end

  private
  def self.conn
    Faraday.new(:url => ENV['CENSUS_BASE_URL']) do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.token
    response = conn.post do |req|
      req.url '/oauth/token'
      req.params['grant_type'] = 'client_credentials'
      req.params['client_id'] = ENV['CENSUS_CLIENT_ID']
      req.params['client_secret'] = ENV['CENSUS_SECRET_ID']
    end
    JSON.parse(response.body)["access_token"]
  end
end
