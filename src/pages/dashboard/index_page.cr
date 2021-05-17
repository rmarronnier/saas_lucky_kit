class Dashboard::IndexPage < MainLayout
  def page_title
    "Dashboard"
  end

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      div class: "border-b border-gray-200 px-4 py-5 sm:px-6" do
        h1 "Your Dashboard", class: "font-medium text-lg"
      end

      div class: "px-4 py-5 sm:p-6" do
        h3 "We should put some content here..."
        ul do
          li current_user.customer_id.to_s
          mount Shared::CheckoutCTA, price_id: "price_1IqjDxJN5FrkuvKhKExUK1B2"
        end
      end
    end
  end
end
