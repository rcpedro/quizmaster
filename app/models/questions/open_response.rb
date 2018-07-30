class Questions::OpenResponse < Question
  has_one :answer, foreign_key: :question_id
end