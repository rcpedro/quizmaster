class SessionForm < Form
  attr_reader :session, :params

  def initialize(params)
    super()
    @params = SessionFormParams.new(params)
    @session = Session.new({ quiz_id: @params.quiz_id })
    @session = Session.find(params[:id]) if params[:id].present?
    @new = @session.persisted?
  end

  def save
    result = true
    self.transaction(@session) do
      @session.assign_attributes(quiz_id: @params.quiz_id)
      result &&= self.try_save(@session)
      result &&= self.populate if @session.questions.count == 0
    end
    return result
  end

  def populate
    result = true
    @session.quiz.questions.each do |question|
      result &&= self.try_save(@session.session_questions.new(question: question))
    end
    return result
  end
end