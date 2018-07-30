class QuizForm < Form
  attr_reader :quiz, :params

  def initialize(params)
    super()
    @params = QuizFormParams.new(params)
    @quiz = Quiz.new({ student: self.current_user, course_id: @params.course_id })
  end

  def create
    result = true
    self.transaction(@quiz) do
      result &&= self.try_save(@quiz)
      result &&= self.save_associations(@quiz.quiz_options, @params.options)
    end
    return result
  end
end