class Api::V1::SubtopicsController < ApplicationController
  before_action :set_query, only: [:index]
  before_action :set_subtopic, only: [:show]

  def index
    render json: @query.list(params)
  end

  def show
    render json: @subtopic
  end

  protected
    def set_query
      @query = SubtopicQuery.new
    end

    def set_course
      @subtopic = Subtopic.find(params[:id])
    end
end
