class Options::Subtopic < Option
  def filter(questions, config)
    return questions.joins(:subtopic).filter(id: { in: config['subtopics'] })
  end
end