class CustomerPortal::Create < BrowserAction
  get "/customer-portal" do
    return_url = "#{Lucky::RouteHelper.settings.base_uri}/me"

    session = Stripe::BillingPortal::Session.create(
      customer: current_user.customer_id.not_nil!,
      return_url: return_url
    )
    redirect session.url.not_nil!
  end
end
