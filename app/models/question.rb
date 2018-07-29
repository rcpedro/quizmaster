class Question < ApplicationRecord
  self.abstract_class = true

  belongs_to :subtopic
  has_one :topic, through: :subtopic
  has_one :course, through: :topic

  validates :status, presence: true
end
