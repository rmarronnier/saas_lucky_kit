require "../temp_stripe_support/*"

struct Product
  getter id : String
  getter name : String
  getter description : String?
  getter tier : User::Tier
  getter month_price : Stripe::Price
  getter annual_price : Stripe::Price?

  def initialize(product : Stripe::Product)
    @id = product.id
    @name = product.name
    @description = product.description
    @tier = User::Tier.new(product.not_nil!.metadata.not_nil!["tier"].to_s)
    @month_price = Stripe::Price.list(active: true, product: product.id, recurring: {"interval" => "month"}).first
    @annual_price = nil # Stripe::Price.list(active: true, product: product.id, recurring: {"interval" => "year"}).first
  end
end

class ProductsData
  property products : Array(Product)

  INSTANCE = new

  def initialize
    # products = Stripe::Product.list({active: true})
    @products = Stripe::Product.list.map { |product| Product.new(product) }
    # @products = Hash(String, Product).new
    # products.each do |product|
    #   @products[product.id] = Product.new(product)
    # end
  end

  def refresh
    @products = Stripe::Product.list # ({active: true})
    # @products = Hash(String, Product).new
    # products.each do |product|
    #   products[product.id] = Product.new(product)
    # end
  end
end
