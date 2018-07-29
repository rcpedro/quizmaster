class TopicQuery
  def list(params)
    return Topic.filter({
      code: { startswith: params[:code] },
      name: { startswith: params[:name] },
      description: { contains: params[:description] },
      course_id:   { eq: params[:course_id] }
    })
  end
end