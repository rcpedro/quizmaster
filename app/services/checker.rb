class Checker
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def validate
    valid = @question.answer.value.downcase == @answer.to_s.downcase
    valid ||= @question.answer.value.casecmp(@answer.to_i.to_words) if @answer.match(/-?\d+(?:\.\d+)?/)

    return valid
  end
end