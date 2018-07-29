class SubtopicsQuery
  def list(params)
    return Topic.filter({
      code: { startswith: params[:code] },
      name: { startswith: params[:name] },
      description: { contains: params[:description] },
      subtopic_id: { eq: params[:subtopic_id] }
    })
  end
end