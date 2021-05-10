def stripe_key_from_env
  ENV["STRIPE_KEY"]? || raise_missing_stripe_key_message
end

def raise_missing_stripe_key_message
  puts "Missing STRIPE_KEY. Set the STRIPE_KEY env variable to 'unused' if not using Stripe, or set the STRIPE_KEY ENV var.".colorize.red
  exit(1)
end

Stripe.api_key = stripe_key_from_env unless Lucky::Env.test?
