class StripeEvents::Webhook < ApiAction
  include Api::Auth::SkipRequireAuthToken
  accepted_formats [:json, :xml], default: :json
  post "/stripe/webhook" do
    # You can use webhooks to receive information about asynchronous payment events.
    # For more about our webhook events check out https://stripe.com/docs/webhooks.
    webhook_secret = Application.settings.stripe_webhook_secret
    # json({signature_header: request.headers["Stripe-Signature"], webhook_secret: webhook_secret, payload: params.from_json})
    # head 500 if webhook_secret.nil?
    # payload = params.from_json
    # # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
    signature_header = request.headers["Stripe-Signature"]
    # # event = nil
    # begin
    begin
      event = Stripe::Webhook.construct_event(payload: request.body.not_nil!.gets_to_end, sig_header: signature_header, secret: webhook_secret)
    rescue e : JSON::SerializableError
      Log.error { e.message }
      json({status: "error", error: e.message})
    rescue e2 : SignatureVerificationError
      Log.error { "⚠️  Webhook signature verification failed." }
      json({status: "error", error: e2})
    else
      json({status: "success", event: event.not_nil!})
    end
    # rescue SignatureVerificationError
    #   # Invalid signature
    #   puts "⚠️  Webhook signature verification failed."
    #   head 400
    # end
    # # Get the type of webhook event sent - used to check the status of PaymentIntents.
    # event_type = event.not_nil!.type
    # # data_object = data["object"]
    # puts "🔔  Payment succeeded!" if event_type == "checkout.session.completed"
    # if !event.nil?
    #   json({status: "success", event: event})
    # else
    #   json({status: "error", error: e)
    # end
  end
end
