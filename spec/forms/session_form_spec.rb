require 'rails_helper'

RSpec.describe 'Session Form' do
  before :all do
    @course = Course.math
    qp = ActionController::Parameters.new({
      course_id: @course.id,
      options: [ 
        { option_id: Option.no_of_questions.id, config: { value: 3 }},
        { option_id: Option.subtopic.id, config: { subtopics: [@course.subtopics[0].id, @course.subtopics[1].id] }}
      ]
    })

    @qform = QuizForm.new(qp)
    @qform.create

    @valid = ActionController::Parameters.new({ quiz_id: @qform.quiz.id })
    @validform = SessionForm.new(@valid)
  end

  it 'has a quiz' do
    expect(@validform.params.quiz_id).to eq(@qform.quiz.id)
  end

  it 'can save a valid form' do
    expect(@validform.save).to be true
    expect(@validform.session.persisted?).to be true
  end
end