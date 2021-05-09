class Application
  Habitat.create do
    setting name : String
    setting support_email : Carbon::Address
  end
end

Application.configure do |settings|
  settings.name = "SaaS Kit"
  settings.support_email = Carbon::Address.new(settings.name, "no-reply@saas_kit.com")
end
