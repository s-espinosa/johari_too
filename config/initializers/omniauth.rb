Rails.application.config.middleware.use OmniAuth::Builder do
  provider :census, ENV["CENSUS_CLIENT_ID"], ENV["CENSUS_SECRET_ID"], {
    :name => "census"
  }
end
