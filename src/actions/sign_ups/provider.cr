# class SignUps::Provider < BrowserAction
#   include Auth::RedirectSignedInUsers

#   post "/sign_up_provider" do
#     SignUpUserViaProvider.create(params) do |operation, user|
#       if user
#         flash.info = "Thanks for signing up."
#         sign_in(user)
#         redirect Me::Show
#       else
#         flash.info = "Couldn't sign you up."
#         redirect SignUps::New
#       end
#     end
#   end
# end
