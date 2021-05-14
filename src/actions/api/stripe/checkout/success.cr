class CheckoutSession::Success < ApiAction
  include Api::Auth::SkipRequireAuthToken

  post "/checkout/success/:checkout_session_id" do
    session = Stripe::Checkout::Session.retrieve(checkout_session_id)
    json (session)
  end
end

# Probably useless endpoint . Brwoseraction equivalent created
