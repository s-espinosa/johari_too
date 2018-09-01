class CensusService
  def self.current_user(token)
    response = conn.get do |req|
      req.url '/api/v1/user_credentials'
      req.params['access_token'] = token
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
end
