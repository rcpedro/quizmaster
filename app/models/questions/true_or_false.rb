class Questions::TrueOrFalse < Question
  has_one :answer, foreign_key: :question_id
end