class Subscribe::Index < BrowserAction
  get "/subscribe" do
    html IndexPage
  end
end
