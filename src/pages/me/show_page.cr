class Me::ShowPage < MainLayout
  def page_title
    "Your Profile"
  end

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      div class: "border-b border-gray-200 px-4 py-5 sm:px-6" do
        h1 "Your profile", class: "font-medium text-lg"
      end
      div class: "px-4 py-5 sm:p-6" do
        h3 "Email:  #{current_user.email}"
        ul do
          li current_user.customer_id.to_s
          li current_user.tier.to_s
        end
        aside do
          ProductsData::INSTANCE.products.each do |product|
            h4 product.name
            mount Shared::CheckoutCTA, price_id: product.month_price.id
          end
          mount Shared::CustomerPortalLink
        end
      end
    end
  end
end
