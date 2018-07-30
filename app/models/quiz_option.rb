class QuizOption < ApplicationRecord
  belongs_to :quiz
  belongs_to :option
end
