class QuestionFormParams
  attr :question, :answers, :answer, :choices, :content
  
  def initialize(params, model)
    @question = params.require(:question).permit(:id, :subtopic_id, :status, :type)
    @answers = params.require(:answers).map { |a| a.permit! } if model.respond_to?(:answers)
    @choices = params.require(:choices).map { |c| c.permit! } if model.respond_to?(:choices)
    @answer = params.require(:answer).permit(:id, :value)     if model.respond_to?(:answer)
    @content = params.require(:content).permit(:id, :markdown)
  end
end