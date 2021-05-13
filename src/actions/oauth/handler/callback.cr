class OAuth::Handler::Callback < BrowserAction
  include Auth::AllowGuests
  get "/oauth/:provider/callback" do
    Log.info { "callback" }
    user = MultiAuthHandler.user(provider, request.query_params)
    puts user.email.to_s
    Log.dexter.info { {user_email: user.email.to_s} }
    plain_text user.email.to_s
  end
end
