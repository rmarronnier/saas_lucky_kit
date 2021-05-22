class StripeEvents::Webhook < ApiAction
  include Api::Auth::SkipRequireAuthToken
  accepted_formats [:json, :xml]
  post "/stripe/webhook" do
    # You can use webhooks to receive information about asynchronous payment events.
    # For more about our webhook events check out https://stripe.com/docs/webhooks.
    webhook_secret = ENV["STRIPE_WEBHOOK_SECRET"]?
    head 500 if webhook_secret.nil?
    payload = request.body.to_s
    # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
    sig_header = request.headers["Stripe-Signature"]
    # event = nil
    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, webhook_secret.not_nil!)
    rescue SignatureVerificationError
      # Invalid signature
      puts "⚠️  Webhook signature verification failed."
      head 400
    end
    # Get the type of webhook event sent - used to check the status of PaymentIntents.
    event_type = event.not_nil!.type
    # data_object = data["object"]
    puts "🔔  Payment succeeded!" if event_type == "checkout.session.completed"
    json({status: "success"})
  end
end
