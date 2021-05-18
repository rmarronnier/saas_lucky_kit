class Subscription < BaseModel
  avram_enum Status do
    Incomplete
    IncompleteExpired
    Trialing
    Active
    PastDue
    Canceled
    Unpaid
  end

  table do
    column stripe_id : String
    column status : Subscription::Status
    column stripe_price_id : String
    column stripe_product_id : String
    belongs_to user : User
  end

  def tier_from_associated_product
    ProductsData::INSTANCE.products.find { |product| @stripe_product_id == product.id }.not_nil!.tier
  end
end
