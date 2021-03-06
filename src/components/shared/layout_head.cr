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
      # script src: "https://apis.google.com/js/api.js?onload=onLibraryLoaded", attrs: [:async, :defer]
      # script src: "https://apis.google.com/js/platform.js?onload=onLibraryLoaded", attrs: [:async, :defer]
      # script src: "https://accounts.google.com/gsi/client", attrs: [:async, :defer]
      # meta name: "google-signin-client_id", content: ENV["GOOGLE_SECRET_KEY"]
      js_link asset("js/app.js"), defer: "true", data_turbolinks_track: "reload"
      script src: "https://js.stripe.com/v3/" # if @page_title == "Checkout"
      js_link asset("js/checkout.js")         # if @page_title == "Checkout"
      meta name: "turbolinks-cache-control", content: "no-cache"
      meta name: "viewport", content: "width=device-width, initial-scale=1"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end
