class ConfirmSignUp < User::SaveOperation
  param_key :user

  # include CustomerInit

  permit_columns confirmed_at
end
