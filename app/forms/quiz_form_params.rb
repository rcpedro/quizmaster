class QuizFormParams
  attr :options, :course_id

  def initialize(params)
    @course_id = params.require(:course_id)
    @options = params[:options].map { |o| o.permit! } if params[:options].present?
  end
end