require 'rails_helper'

RSpec.describe 'Quiz Form' do
  before :all do
    @course = Course.math

    @valid = ActionController::Parameters.new({
      course_id: @course.id,
      options: [ 
        { option_id: Option.no_of_questions.id, config: { value: 3 }},
        { option_id: Option.subtopic.id, config: { subtopics: [@course.subtopics[0].id, @course.subtopics[1].id] }}
      ]
    })

    @invalid = ActionController::Parameters.new({})

    @optionlessform = QuizForm.new(ActionController::Parameters.new({ course_id: @course.id }))
    @validform = QuizForm.new(@valid)
  end

  it 'has a course id' do 
    expect(@validform.params.course_id).to eq(@course.id)
  end

  it 'has options' do
    expect(@validform.params.options.size).to eq(2)
  end

  it 'can save a valid form' do
    expect(@validform.create).to be true
    expect(@validform.quiz.persisted?).to be true
    expect(@validform.quiz.options.count).to eq(2)
  end

  it 'can save an optionless form' do 
    expect(@optionlessform.create).to be true
    expect(@optionlessform.quiz.options.count).to eq(0)
  end

  it 'cannot save an invalid form' do 
    expect { QuizForm.new(@invalid) }.to raise_error
  end

  it 'can get questions based on options' do
    expect(@validform.quiz.questions.count).to_not eq(0)
  end
end