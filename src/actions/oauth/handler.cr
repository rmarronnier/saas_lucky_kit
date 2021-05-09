class OAuth::Handler < BrowserAction
  get "/oauth/:provider" do
    redirect to: MultiAuthHandler.authorize_uri(provider)
  end
end
