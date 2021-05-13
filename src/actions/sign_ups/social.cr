class SignUps::Social < BrowserAction
  include Auth::RedirectSignedInUsers

  post "/sign_up_social" do
    SignUpSocial.create(params) do |operation, user|
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
