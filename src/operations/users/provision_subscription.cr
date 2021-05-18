class ProvisionSubscription < User::SaveOperation
  # attribute tier : User::Tier
  # attribute subscription_id : String

  before_save do
    # validate_uniqueness_of email
    # tier.value = @tier
    # subscription_id.value = @id
  end

  after_commit send_confirmation_email

  private def send_confirmation_email(user)
    # SubscriptionConfirmationEmail.new(user).deliver_later
  end
end
