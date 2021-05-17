class CheckoutSessionBrowser::Success < BrowserAction
  get "/checkout/success/:checkout_session_id" do
    session = Stripe::Checkout::Session.retrieve(checkout_session_id)
    case session.payment_status
    when Stripe::Checkout::Session::PaymentStatus::Paid
      subscription = Stripe::Subscription.retrieve(session.subscription.not_nil!)
      # check if subscription.status == Active
      SaveSubscription.create(subscription: subscription) do |_, new_subscription|
        if new_subscription
          ProvisionSubscription.update!(current_user, tier: new_subscription.tier_from_associated_product)
          flash.success = "Thank you !"
        else
        end
      end
    else
      # html checkout completed // awaiting for paiement confirmation
    end
    html Checkout::SuccessPage, checkout_session: session
    #
  end
end
