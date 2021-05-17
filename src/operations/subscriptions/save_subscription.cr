class SaveSubscription < Subscription::SaveOperation
  needs subscription : Stripe::Subscription

  before_save do
    # validate_uniqueness_of email

    stripe_id.value = @subscription.id
    status.value = Subscription::Status.new(@subscription.status.to_s)
    stripe_price_id.value = @subscription.items.not_nil!.first.price.not_nil!.id
    stripe_product_id.value = @subscription.items.not_nil!.first.price.not_nil!.product.to_s
    # user_id.value = UserQuery.new.customer_id(@subscription.customer).first?.id
  end
end
