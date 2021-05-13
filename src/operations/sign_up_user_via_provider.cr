class SignUpUserViaProvider < User::SaveOperation
  param_key :user

  include CustomerInit

  permit_columns email

  before_save do
    validate_uniqueness_of email
    auto_confirm_email
    Authentic.copy_and_encrypt Random::Secure.urlsafe_base64(32), to: encrypted_password
  end

  # after_commit send_confirmation_email

  private def auto_confirm_email
    confirmed_at.value = Time.utc
  end
end
