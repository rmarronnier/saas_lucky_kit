class Shared::CheckoutCTA < BaseComponent
  needs price_id : String

  def render
    button "Upgrade to", class: "px-4 py-2 lg:px-6 bg-purple-800 hover:bg-purple-900 rounded text-white checkout-button", data_subscribe: @price_id, id: @price_id
  end
end
