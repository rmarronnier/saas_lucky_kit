class Subscribe::IndexPage < MainLayout
  def page_title
    "Checkout"
  end

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      div class: "border-b border-gray-200 px-4 py-5 sm:px-6" do
        h1 "Your Dashboard", class: "font-medium text-lg"
      end

      div class: "px-4 py-5 sm:p-6" do
        render_form
      end
    end
  end

  private def render_form
    form id: "payment-form" do
      div id: "card-element"
      div id: "card-element-errors", role: "alert"
      button "Subscribe", type: "submit", id: "submit-payment-btn"
    end
  end
end
