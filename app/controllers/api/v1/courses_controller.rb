class Api::V1::CoursesController < ApplicationController
  before_action :set_query, only: [:index]
  before_action :set_course, only: [:show]

  def index
    render json: @query.list(params)
  end

  def show
    render @course
  end

  protected
    def set_query
      @query = CourseQuery.new
    end

    def set_course
      @course = Course.find(params[:id])
    end
end
