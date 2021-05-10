module MultiAuthConfig
  def provider_client_id_from_env(provider : String)
    ENV["#{provider.upcase}_CLIENT_ID"]? || raise_missing_client_id_message(provider)
  end

  def raise_missing_client_id_message(provider : String)
    puts "Missing #{provider.upcase}_CLIENT_ID. Set the #{provider.upcase}_CLIENT_ID env variable to 'unused' if not using #{provider} auth, or set the #{provider.upcase}_CLIENT_ID ENV var.".colorize.red
    exit(1)
  end

  def provider_secret_key_from_env(provider : String)
    ENV["#{provider.upcase}_SECRET_KEY"]? || raise_missing_secret_key_message(provider)
  end

  def raise_missing_secret_key_message(provider : String)
    puts "Missing #{provider.upcase}_SECRET_KEY. Set the #{provider.upcase}_SECRET_KEY env variable to 'unused' if not using #{provider} auth, or set the #{provider.upcase}_SECRET_KEY ENV var.".colorize.red
    exit(1)
  end

  def credentials_tuple_from_env(provider : String)
    {provider, provider_client_id_from_env(provider), provider_secret_key_from_env(provider)}
  end
end

class MultiAuthHandler
  extend MultiAuthConfig

  # MultiAuth.config(*credentials_tuple_from_env("facebook"))
  MultiAuth.config(*credentials_tuple_from_env("google")) unless Lucky::Env.test?

  def self.authorize_uri(provider : String)
    MultiAuth.make(provider, "#{Lucky::RouteHelper.settings.base_uri}/oauth/#{provider}/callback").authorize_uri(scope: "email")
  end

  def self.user(provider : String, params : Enumerable({String, String}))
    MultiAuth.make(provider, "#{Lucky::RouteHelper.settings.base_uri}/oauth/#{provider}/callback").user(params)
  end
end
