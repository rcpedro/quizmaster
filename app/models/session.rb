class Session < ApplicationRecord
  has_many :session_questions
  has_many :questions, through: :session_questions
  has_many :session_question_answers, through: :session_questions

  validates :start, :status, presence: true
end
