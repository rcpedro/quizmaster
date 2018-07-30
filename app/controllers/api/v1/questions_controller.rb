class Api::V1::QuestionsController < ApplicationController
  before_action :set_query, only: [:index]
  before_action :set_question, only: [:show, :update, :destroy]
  before_action :set_form, only: [:create, :update]

  STANDARD_INCLUDES = [
    { course:    { only: [:id, :name] }}, 
    { topic:     { only: [:id, :name] }},
    { subtopic:  { only: [:id, :name] }},
    { draft:     { only: [:id, :markdown, :updated_by] }}, 
    { published: { only: [:id, :markdown, :updated_by] }}
  ]
  SHOW_INCLUDES = lambda { |question|
    { 
      include: STANDARD_INCLUDES + ANSWER_SOURCES.map { |m| m if question.respond_to?(m) }.compact,
      methods: [:type]
    }
  }

  ANSWER_SOURCES = [:answer, :answers, :choices]

  def index
    render json: @query.list(params).as_json(include: STANDARD_INCLUDES)
  end

  def show
    render json: @question.as_json(SHOW_INCLUDES.call(@question))
  end

  def create
    if @form.create
      render json: @form.question.as_json(SHOW_INCLUDES.call(@form.question))
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def update
    if @form.update
      render json: @form.question.as_json(SHOW_INCLUDES.call(@form.question))
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    render json: {}, status: :ok
  end

  protected
    def set_query
      @query = QuestionQuery.new
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def set_form
      @form = QuestionForm.new(params)
    end
end
