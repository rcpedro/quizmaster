class QuestionsQuery
  def list(params)
    return Question.filter({
      course_id:   { eq: params[:course_id] },
      topic_id:    { eq: params[:topic_id] },
      subtopic_id: { eq: params[:subtopic_id] }
    })
  end
end