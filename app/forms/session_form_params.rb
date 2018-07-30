class SessionFormParams
  attr :quiz_id, :answer

  def initialize(params)
    @quiz_id = params.require(:quiz_id)
    @answer = params[:answer].map { |a| a.permit! } if params[:answer].is_a?(Array)
    @answer = params[:answer] if @answer.nil?

    
  end
end