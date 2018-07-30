class SessionQuestion < ApplicationRecord
  belongs_to :session
  belongs_to :question

  has_many :session_question_answers
end
