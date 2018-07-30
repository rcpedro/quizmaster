class Options::QuestionCount < Option
  def filter(questions, config)
    return questions.limit(config['value'])
  end
end