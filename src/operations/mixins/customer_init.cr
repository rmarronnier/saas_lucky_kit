module CustomerInit
  macro included
    before_save create_stripe_customer
  end

  private def create_stripe_customer
    customer = Stripe::Customer.create(email: email.value)
    customer_id.value = customer.id
  end
end
