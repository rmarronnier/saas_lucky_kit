module Users::Customer
  macro included
    avram_enum Tier do
      Free
      Basic
      Premium
      Pro
      Custom # For specific Entreprise plans
    end
    column customer_id : String?
    column tier : User::Tier = 0
    has_one subscription : Subscription
  end
end
