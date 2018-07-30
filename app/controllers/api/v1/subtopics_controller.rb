class Api::V1::SubtopicsController < ApplicationController
  before_action :set_query, only: [:index]
  before_action :set_subtopic, only: [:show]

  STANDARD_INCLUDES = [:course, :topic]

  def index
    render json: @query.list(params).as_json(include: STANDARD_INCLUDES)
  end

  def show
    render json: @subtopic.as_json(include: STANDARD_INCLUDES)
  end

  protected
    def set_query
      @query = SubtopicQuery.new
    end

    def set_course
      @subtopic = Subtopic.find(params[:id])
    end
end
