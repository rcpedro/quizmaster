class Api::V1::TopicsController < ApplicationController
  before_action :set_query, only: [:index]
  before_action :set_topic, only: [:show]

  def index
    render json: @query.list(params).as_json(include: { subtopics: { only: [:id] }})
  end

  def show
    render json: @topic
  end

  protected
    def set_query
      @query = TopicQuery.new
    end

    def set_course
      @topic = Topic.find(params[:id])
    end
end
