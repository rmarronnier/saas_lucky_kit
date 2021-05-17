# class CheckoutSession::Create < BrowserAction
class Subscribe::Create < BrowserAction
  # include Api::Auth::SkipRequireAuthToken
  get "/create-checkout-session/:price_id" do
    # customer_id = params.from_json["customer_id"].to_s
    # price_id = params.from_json["price_id"].to_s
    # Create new Checkout Session for the order
    # Other optional params include:
    # [billing_address_collection] - to display billing address details on the page
    # [customer] - if you have an existing Stripe Customer ID
    # [customer_email] - lets you prefill the email input in the form
    # For full details see https://stripe.com/docs/api/checkout/sessions/create
    # ?session_id={CHECKOUT_SESSION_ID} means the redirect will have the session ID set as a query param

    session = Stripe::Checkout::Session.create(
      customer: current_user.customer_id,
      success_url: "#{Lucky::RouteHelper.settings.base_uri}/checkout/success/{CHECKOUT_SESSION_ID}",
      cancel_url: "#{Lucky::RouteHelper.settings.base_uri}/checkout/cancelled",
      payment_method_types: ["card"],
      mode: "subscription",
      line_items: [{
        quantity: 1,
        price:    price_id,
      }],
    )

    json({
      sessionId: session.id.to_s,
    })
  end
end
