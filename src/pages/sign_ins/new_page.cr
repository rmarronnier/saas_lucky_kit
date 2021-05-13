class SignIns::NewPage < AuthLayout
  needs operation : SignInUser

  def page_title
    "Sign In"
  end

  def content
    mount Shared::CenteredFormPanel, title: title_text do
      auth_providers_buttons
      render_form(operation)
    end
  end

  private def render_form(op)
    form_for SignIns::Create do
      div class: "space-y-6" do
        mount Shared::Field, op.email, "Email", &.email_input(autofocus: "true", placeholder: "you@example.com")
        mount Shared::Field, op.password, "Password", &.password_input(placeholder: "*" * 12)
      end

      div class: "mt-6" do
        span class: "block w-full rounded-md shadow-sm" do
          submit "Sign in", class: "w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-500 cursor-pointer focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700 transition duration-150 ease-in-out", flow_id: "sign-in-button"
        end
      end

      div class: "mt-6 flex flex-col sm:flex-row space-y-2 sm:space-y-0 items-center justify-between" do
        div class: "text-sm leading-5" do
          link "Sign up", to: SignUps::New, class: link_class
        end

        div class: "text-sm leading-5" do
          link "Resend confirmation", to: SignUpConfirmationRequests::New, class: link_class
        end

        div class: "text-sm leading-5" do
          link "Forgot your password?", to: PasswordResetRequests::New, class: link_class
        end
      end
    end
  end

  private def link_class
    "font-medium text-primary-600 hover:text-primary-500 focus:outline-none focus:underline transition ease-in-out duration-150"
  end

  private def title_text
    "Sign in"
  end

  private def auth_providers_buttons
    # div class: "g-signin2", data_onsuccess: "onSignIn"
    # button "Sign in with button onClick", onclick: "onSignInClicked()"
    # div " ", "data-auto_prompt": "false", "data-client_id": ENV["GOOGLE_SECRET_KEY"], "data-login_uri": "#{Lucky::RouteHelper.settings.base_uri}/oauth/google/callback", "data-ux_mode": "redirect", id: "g_id_onload"
    # div " ", class: "g_id_signin", "data-logo_alignment": "left", data_shape: "rectangular", data_size: "large", data_text: "sign_in_with", data_theme: "outline", data_type: "standard"

    # div " ", "data-client_id": ENV["GOOGLE_SECRET_KEY"], "data-login_uri": "#{Lucky::RouteHelper.settings.base_uri}/oauth/google/callback", "data-your_own_param_1_to_login": "any_value", "data-your_own_param_2_to_login": "any_value", id: "g_id_onload"
  end
end
