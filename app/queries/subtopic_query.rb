class SubtopicQuery
  def list(params)
    return Subtopic.filter({
      code: { startswith: params[:code] },
      name: { startswith: params[:name] },
      description: { contains: params[:description] },
      subtopic_id: { eq: params[:subtopic_id] }
    })
  end
end