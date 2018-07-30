module SoftDeletable
  extend ActiveSupport::Concern

  included do
    default_scope { where.not(status: self.statuses[:deleted]) }
  end

  def destroy
    self.status = self.class.statuses[:deleted]
    self.save
  end

  def destroy!
    self.status = self.class.status[:deleted]
    self.save!
  end
end