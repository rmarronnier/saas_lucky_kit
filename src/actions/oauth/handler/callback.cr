class OAuth::Handler::Callback < BrowserAction
  get "/oauth/:provider/callback" do
    user = MultiAuthHandler.user(provider, request.query_params)
    plain_text user.email.to_s
  end
end