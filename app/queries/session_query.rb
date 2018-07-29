class SessionQuery
  def list(params)
    return Session.filter({
      user_id: { eq: params[:user_id] },
      start: {
        sameday:   params[:day],
        sameweek:  params[:week],
        samemonth: params[:month]
      }
    })
  end
end