class SignUpUserViaProvider < User::SaveOperation
  param_key :user

  # include CustomerInit

  permit_columns email

  before_save do
    validate_uniqueness_of email
    auto_confirm_email
    set_placeholder_password
    # Authentic.copy_and_encrypt Random::Secure.urlsafe_base64(8, padding: true), to: encrypted_password
  end

  # after_commit send_confirmation_email

  private def auto_confirm_email
    confirmed_at.value = Time.utc
  end

  private def set_placeholder_password
    encrypted_password.value = Random::Secure.urlsafe_base64(8, padding: true)
  end
end
