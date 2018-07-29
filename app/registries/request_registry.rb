class RequestRegistry
  extend ActiveSupport::PerThreadRegistry

  attr_accessor :current_user, :current_permissions
end