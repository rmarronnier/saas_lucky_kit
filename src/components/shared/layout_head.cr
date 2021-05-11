class Shared::LayoutHead < BaseComponent
  needs page_title : String
  # This is used by the 'csrf_meta_tags' method
  needs context : HTTP::Server::Context

  def render
    head do
      utf8_charset
      title "#{Application.settings.name} - #{@page_title}"
      css_link asset("css/app.css"), data_turbolinks_track: "reload"
      script src: "https://apis.google.com/js/platform.js", attrs: [:async, :defer]
      script src: "https://js.stripe.com/v3/"
      js_link asset("js/app.js"), defer: "true", data_turbolinks_track: "reload"
      meta name: "turbolinks-cache-control", content: "no-cache"
      meta name: "google-signin-client_id", content: "543827997371-7o38nloue8pbemsdei4vqkv19ftcca9f.apps.googleusercontent.com"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end
