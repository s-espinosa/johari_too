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
    Faraday.new(:url => 'https://login.turing.io/') do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
    end
  end
end
