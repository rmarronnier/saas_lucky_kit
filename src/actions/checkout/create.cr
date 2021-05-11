class Checkout::Create < BrowserAction
include Checkout::RedirectExistingCustomers
  post "/create-checkout-session" do

checkout_session = Stripe::Checkout::Session.create(mode: "payment", payment_method_types: ["card"], cancel_url: "https://test.com", success_url: "https://test.com", line_items: [{quantity: 1, price: "price_1234awioejawef"}])

json { sessionId: checkout_session.id }.to_json

    Checkout.create(params) do |operation, customer|
      if user
        flash.info = "Thanks for signing up. We've sent you a confirmation email"
        redirect SignIns::New
      else
        flash.info = "Couldn't sign you up"
        html NewPage, operation: operation
      end
    end
  end
end