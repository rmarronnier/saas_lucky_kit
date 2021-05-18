class Shared::CustomerPortalLink < BaseComponent
  def render
    link "Manage your subscription", to: CustomerPortal::Create
  end
end
