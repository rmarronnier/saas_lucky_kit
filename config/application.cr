class Application
  Habitat.create do
    setting name : String
    setting support_email : Carbon::Address
    setting stripe_webhook_secret : String
  end
end

Application.configure do |settings|
  settings.name = ENV["APP_NAME"]
  settings.support_email = Carbon::Address.new(settings.name, "no-reply@#{ENV["APP_DOMAIN"]}")
  settings.stripe_webhook_secret = ENV["STRIPE_WEBHOOK_SECRET"]
  puts "sd4658f4ds56f44sdf564sd56f4s6d54fsd65f4s65df4sd65f4sdf4545dfs45d6sfsdf456" if ENV["STRIPE_WEBHOOK_SECRET"].size < 10
end
