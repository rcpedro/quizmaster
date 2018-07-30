class ApplicationRecord < ActiveRecord::Base
  include Filterable
  self.abstract_class = true

  before_save :set_user_for_audit

  protected
    def set_user_for_audit
      self.created_by = RequestRegistry.current_user || User::SYSTEM if not self.persisted? and self.respond_to?(:created_by)
      self.updated_by = RequestRegistry.current_user || User::SYSTEM if self.respond_to?(:updated_by)
    end
end
