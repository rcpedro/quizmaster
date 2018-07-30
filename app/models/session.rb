class Session < ApplicationRecord
  belongs_to :quiz
  
  has_many :session_questions
  has_many :questions, through: :session_questions
  has_many :session_question_answers, through: :session_questions

  validates :quiz_id, :start, :status, presence: true
  before_validation :set_start_if_pending

  enum status: [:ongoing, :finished, :abandoned]

  def completed?
    return self.session_question_answers.count == self.session_questions.count
  end

  protected
    def set_start_if_pending
      self.start = DateTime.now
    end
end
