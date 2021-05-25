require "carbon_postmark_adapter"

BaseEmail.configure do |settings|
  if Lucky::Env.production?
    postmark_api_token = postmark_api_token_from_env
    settings.adapter = Carbon::PostmarkAdapter.new(server_token: postmark_api_token)
  else
    settings.adapter = Carbon::DevAdapter.new(print_emails: true)
  end
end

private def postmark_api_token_from_env
  ENV["POSTMARK_API_TOKEN"]? || raise_missing_key_message
end

private def raise_missing_key_message
  puts "Missing POSTMARK_API_TOKEN. Set the POSTMARK_API_TOKEN env variable to '' if not sending emails, or set the POSTMARK_API_TOKEN ENV var.".colorize.red
  exit(1)
end
