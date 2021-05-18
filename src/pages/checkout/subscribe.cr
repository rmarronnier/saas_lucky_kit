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

  private def render_subscription
  end

  private def render_template
    div class: "w-full mx-auto bg-white px-5 py-10 text-gray-600 mb-10" do
      div class: "text-center max-w-xl mx-auto" do
        h1 "Pricing", class: "text-5xl md:text-6xl font-bold mb-5"
        h3 "Lorem ipsum dolor sit amet consectetur adipisicing elit repellat dignissimos laboriosam odit accusamus porro", class: "text-xl font-medium mb-10"
      end
      div class: "max-w-4xl mx-auto md:flex" do
        div class: "w-full md:w-1/3 md:max-w-none bg-white px-8 md:px-10 py-8 md:py-10 mb-3 mx-auto md:my-6 rounded-md shadow-lg shadow-gray-600 md:flex md:flex-col" do
          div class: "w-full flex-grow" do
            h2 "PERSONAL", class: "text-center font-bold uppercase mb-4"
            h3 "$5/mo", class: "text-center font-bold text-4xl mb-5"
            ul class: "text-sm px-5 mb-8" do
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Lorem ipsum"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Dolor sit amet"
              end
            end
          end
          div class: "w-full" do
            button "Buy Now", class: "font-bold bg-gray-600 hover:bg-gray-700 text-white rounded-md px-10 py-2 transition-colors w-full"
          end
        end
        div class: "w-full md:w-1/3 md:max-w-none bg-white px-8 md:px-10 py-8 md:py-10 mb-3 mx-auto md:-mx-3 md:mb-0 rounded-md shadow-lg shadow-gray-600 md:relative md:z-50 md:flex md:flex-col" do
          div class: "w-full flex-grow" do
            h2 "TEAM", class: "text-center font-bold uppercase mb-4"
            h3 "$15/mo", class: "text-center font-bold text-4xl md:text-5xl mb-5"
            ul class: "text-sm px-5 mb-8" do
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Lorem ipsum"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Dolor sit amet"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Consectetur"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Adipisicing"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Elit repellat"
              end
            end
          end
          div class: "w-full" do
            button "Buy Now", class: "font-bold bg-gray-600 hover:bg-gray-700 text-white rounded-md px-10 py-2 transition-colors w-full"
          end
        end
        div class: "w-full md:w-1/3 md:max-w-none bg-white px-8 md:px-10 py-8 md:py-10 mb-3 mx-auto md:my-6 rounded-md shadow-lg shadow-gray-600 md:flex md:flex-col" do
          div class: "w-full flex-grow" do
            h2 "PRO", class: "text-center font-bold uppercase mb-4"
            h3 "$35/mo", class: "text-center font-bold text-4xl mb-5"
            ul class: "text-sm px-5 mb-8" do
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Lorem ipsum"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Dolor sit amet"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Consectetur"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Adipisicing"
              end
              li class: "leading-tight" do
                i class: "mdi mdi-check-bold text-lg"
                text " Much more..."
              end
            end
          end
          div class: "w-full" do
            button "Buy Now", class: "font-bold bg-gray-600 hover:bg-gray-700 text-white rounded-md px-10 py-2 transition-colors w-full"
          end
        end
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
