class CourseQuery
  def list(params)
    return Course.filter({
      code: { startswith: params[:code] },
      name: { startswith: params[:name] },
      description: { contains: params[:description] } 
    })
  end
end