# class Checkout::Create < ApiAction
#   include Api::Auth::SkipRequireAuthToken

#   post "/create-subscription" do
#     customer_id = params.from_json["customer_id"].to_s
#     price_id = params.from_json["price_id"].to_s
#     subscription = Stripe::Subscription.create(
#       customer: customer_id,
#       items: [{
#         price: price_id,
#       }],
#       expand: ["latest_invoice.payment_intent"]
#     )
#     json("sdfsdf")
#     # json({"subscriptionId" => subscription.id, "clientSecret" => subscription.latest_invoice.as(Stripe::Invoice).payment_intent.as(Stripe::PaymentIntent).client_secret})
#   end
# end
