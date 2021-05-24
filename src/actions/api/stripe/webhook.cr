class StripeEvents::Webhook < ApiAction
  include Api::Auth::SkipRequireAuthToken
  accepted_formats [:json, :xml], default: :json
  post "/stripe/webhook" do
    # You can use webhooks to receive information about asynchronous payment events.
    # For more about our webhook events check out https://stripe.com/docs/webhooks.
    webhook_secret = Application.settings.stripe_webhook_secret
    signature_header = request.headers["Stripe-Signature"]
    begin
      event = Stripe::Webhook.construct_event(payload: request.body.not_nil!.gets_to_end, sig_header: signature_header, secret: webhook_secret)
    rescue e : JSON::SerializableError
      Log.error { e.message }
      json({status: "error", error: e.message}, 500)
    rescue e2 : SignatureVerificationError
      Log.error { "⚠️  Webhook signature verification failed." }
      json({status: "error", error: e2}, 404)
    else
      event_handler(event.not_nil!)
      json({status: "success"})
    end
  end

  private def event_handler(event : Stripe::Event)
    case event.not_nil!.type
    when "checkout.session.completed"
      subscription = Stripe::Subscription.retrieve(event.data.object["subscription"].to_s)
      create_new_subscription(subscription) if SubscriptionQuery.new.stripe_id(subscription.id).first?.nil?
    when "customer.subscription.created"
      subscription = Stripe::Subscription.from_json(event.data.object.to_s) # .retrieve(event.data.object["id"].to_s)
      json({status: "success", subscription_object: subscription})
      # create_new_subscription(subscription) if SubscriptionQuery.new.stripe_id(subscription.id).first?.nil?
    when "customer.subscription.updated"
      # updated_subscription = Stripe::Subscription.from_json(event.data.object.to_s)
      # current_subscription = SubscriptionQuery.new.stripe_id(updated_subscription.id).first
      # update_subscription(updated_subscription, current_subscription)
    when "customer.subscription.deleted"
      # subscription = Stripe::Subscription.from_json(event.data.object.to_s)
      # delete_subscription(subscription) unless SubscriptionQuery.new.stripe_id(subscription.id).first?.nil?
    else
      nil # use raven.cr to notify error
    end
  end

  def create_new_subscription(subscription : Stripe::Subscription)
    SaveSubscription.create(subscription: subscription) do |_, new_subscription|
      if new_subscription
        subscriber = UserQuery.find(new_subscription.user_id)
        ProvisionSubscription.update!(subscriber, tier: new_subscription.tier_from_associated_product)
      else
        # use raven.cr to notify error
      end
    end
  end

  # def update_subscription(updated_subscription : Stripe::Subscription, current_subscription : Subscription)
  #   SaveSubscription.update!(subscription: current_subscription, stripe_id: updated_subscription.id, status: Subscription::Status.new(updated_subscription.status.to_s), stripe_price_id: updated_subscription.stripe_price_id, stripe_product_id: updated_subscription.stripe_product_id, user_id: updated_subscription.customer.to_s) do |_, new_subscription|
  #     if new_subscription
  #       subscriber = UserQuery.find(new_subscription.user_id)
  #       ProvisionSubscription.update!(subscriber, tier: new_subscription.tier_from_associated_product)
  #     else
  #       # use raven.cr to notify error
  #     end
  #   end
  # end

  # def delete_subscription(subscription : Stripe::Subscription)
  #   DeleteSubscription.destroy(subscription) do |_, deleted_subscription|
  #     if deleted_subscription
  #       subscriber = UserQuery.find(deleted_subscription.user_id)
  #       ProvisionSubscription.update!(subscriber, tier: :Free)
  #     else
  #       # use raven.cr to notify error
  #     end
  #   end
  # end
end
