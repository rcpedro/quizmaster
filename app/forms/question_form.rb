class QuestionForm < Form
  attr_reader :question, :params

  def initialize(params)
    super()
    @question = Question.new({ author: self.current_user, type: params[:question][:type] })
    @params = QuestionFormParams.new(params, @question)
    @question = Question.find(@params.question[:id]) if not @params.question[:id].blank?
  end

  def save
    result = true
    self.transaction(@question) do
      @question.assign_attributes(@params.question)

      result &&= self.try_save(@question)
      result &&= self.save_associations(@question.answers, @params.answers) if @params.answers
      result &&= self.save_associations(@question.choices, @params.choices) if @params.choices
      result &&= self.save_associations(@question.question_contents, [@params.content])
      result &&= self.save_related(Answer, @params.answer.merge({question: @question})) if @params.answer
      result &&= self.publish if @question.published?
    end

    return result
  end

  protected
    def publish
      result = true

      draft = @question.draft 
      published = @question.published

      published.status = QuestionContent.statuses[:archived] if published.present?
      draft.status = QuestionContent.statuses[:published] 

      result &&= self.try_save(published) if published.present?
      result &&= self.try_save(draft)

      return result
    end
end