class Api::V1::QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show]
  before_action :set_form, only: [:create]

  def create
    if @form.create
      render json: @form.quiz
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  protected
    def set_quiz
      @quiz = Quiz.find(params.id)
    end

    def set_form
      @form = QuizForm.new(params)
    end
end