module Codeable
  extend ActiveSupport::Concern

  class_methods do
    def method_missing(meth, *args, &block)
      instance = self.find_by(code: meth.to_s.downcase)
      instance = self.find_by(code: meth.to_s.upcase) if instance.nil?
      
      return instance if instance.present?
      super.method_missing(meth, *args, &block)
    end
  end
end