class QuestionContent < ApplicationRecord
  belongs_to :question
  enum status: [:draft, :published, :archived]
  
  validates :status, presence: true
end
