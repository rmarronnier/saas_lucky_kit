class CheckoutSession::Success < BrowserAction
  get "/checkout/success/:checkout_session_id" do
    session = Stripe::Checkout::Session.retrieve(checkout_session_id)
    case session.payment_status
    when Paid
      # Provision the subscription
    else
    end
    json (session)
  end
end
