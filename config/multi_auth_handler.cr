class MultiAuthHandler
  MultiAuth.config("facebook", "facebookClientID", "facebookSecretKey")
  MultiAuth.config("google", "googleClientID", "googleSecretKey")

  def self.authorize_uri(provider : String)
    MultiAuth.make(provider, "#{Lucky::RouteHelper.settings.base_uri}/oauth/#{provider}/callback").authorize_uri(scope: "email")
  end

  def self.user(provider : String, params : Enumerable({String, String}))
    MultiAuth.make(provider, "#{Lucky::RouteHelper.settings.base_uri}/oauth/#{provider}/callback").user(params)
  end
end
