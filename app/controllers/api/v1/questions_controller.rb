class Api::V1::QuestionsController < ApplicationController
  before_action :set_query, only: [:index]
  before_action :set_question, only: [:show, :update]

  STANDARD_INCLUDES = [
    { course:    { only: [:id, :name] }}, 
    { topic:     { only: [:id, :name] }},
    { subtopic:  { only: [:id, :name] }},
    { draft:     { only: [:id, :markdown, :updated_by] }}, 
    { published: { only: [:id, :markdown, :updated_by] }}
  ]

  ANSWER_SOURCES = [:answer, :answers, :choices]

  def index
    render json: @query.list(params).as_json(include: STANDARD_INCLUDES)
  end

  def show
    render json: @question.as_json({ 
      include: STANDARD_INCLUDES + ANSWER_SOURCES.map { |m| m if @question.respond_to?(m) }.compact,
      methods: [:type]
    })
  end

  protected
    def set_query
      @query = QuestionQuery.new
    end

    def set_question
      @question = Question.find(params[:id])
    end
end
