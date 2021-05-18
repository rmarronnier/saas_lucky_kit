class Checkout::SuccessPage < MainLayout
  needs checkout_session : Stripe::Checkout::Session

  def page_title
    "Thank you for your purchase"
  end

  private def render_status(checkout_session)
  end

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      div class: "border-b border-gray-200 px-4 py-5 sm:px-6" do
        h1 "Your Dashboard", class: "font-medium text-lg"
        para "You have completed the checkout process. We're awaiting confirmation of your paiement."
      end

      div class: "px-4 py-5 sm:p-6" do
        h3 "We should put some content here..."
        ul do
          li current_user.customer_id.to_s
        end
      end
    end
  end
end
