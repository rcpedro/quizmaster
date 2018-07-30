class Questions::FillInTheBlank < Question
  has_many :answers, foreign_key: :question_id
end