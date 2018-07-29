class QuestionContent < ApplicationRecord
  belongs_to :question
  
  validates :status, presence: true
end
