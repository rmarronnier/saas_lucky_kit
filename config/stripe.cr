def stripe_secret_key_from_env
  ENV["STRIPE_SECRET_KEY"]? || raise_missing_stripe_secret_key_message
end

def raise_missing_stripe_secret_key_message
  puts "Missing STRIPE_SECRET_KEY. Set the STRIPE_SECRET_KEY env variable to 'unused' if not using Stripe, or set the STRIPE_SECRET_KEY ENV var.".colorize.red
  exit(1)
end

Stripe.api_key = stripe_secret_key_from_env # unless Lucky::Env.test?

# STRIPE_WEBHOOK_SECRET = ENV["STRIPE_WEBHOOK_SECRET"]?
