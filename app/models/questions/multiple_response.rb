class Questions::MultipleResponse < Question
  has_many :choices, foreign_key: :question_id
end