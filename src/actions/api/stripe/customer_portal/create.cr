class CheckoutSession::Create < ApiAction
  post "/customer-portal" do
    return_url = "#{Lucky::RouteHelper.settings.base_uri}/customer_portal_return"

    session = Stripe::BillingPortal::Session.create(
      customer: current_user.customer_id.not_nil!,
      return_url: return_url
    )

    json({url: session.url})
  end
end
