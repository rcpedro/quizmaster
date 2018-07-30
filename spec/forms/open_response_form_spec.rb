require 'rails_helper'

RSpec.describe 'Question Form (Open Response)' do
  before :all do
    @add = Subtopic.find_by(code: 'ADD')
    @valid = ActionController::Parameters.new({
      question: { subtopic_id: @add.id, type: 'Questions::OpenResponse', status: 1 },
      answer: { value: '2' },
      content: { markdown: 'John and Amy have *two* apples each. John decided to give Amy *one* of his apples. How many apples does Amy have?' }
    })
    @invalid = ActionController::Parameters.new({
      question: { type: 'Questions::OpenResponse' },
      answer: { value: '2' },
      content: { markdown: 'John and Amy have *two* apples each. John decided to give Amy *one* of his apples. How many apples does Amy have?' }
    })
    @existing = ActionController::Parameters.new({
      question: { id: Question.last.id, subtopic_id: @add.id, type: 'Questions::OpenResponse', status: 1 },
      answer: { value: '2' },
      content: { markdown: 'John and Amy have *two* apples each. John decided to give Amy *one* of his apples. How many apples does Amy have?' }
    })

    @validform = QuestionForm.new(@valid)
    @invalidform = QuestionForm.new(@invalid)
    @existingform = QuestionForm.new(@existing)
  end

  it 'has a valid question' do
    expect(@validform.params.question[:subtopic_id]).to eq(@add.id)
    expect(@validform.params.question[:type]).to eq('Questions::OpenResponse')
    expect(@validform.params.question[:status]).to eq(1)
  end

  it 'has a valid answer' do 
    expect(@validform.params.answer[:value]).to eq('2')
  end

  it 'has a valid content' do
    expect(@validform.params.content[:markdown]).to eq('John and Amy have *two* apples each. John decided to give Amy *one* of his apples. How many apples does Amy have?')
  end

  it 'can save a valid form' do
    expect(@validform.save).to be true
    expect(@validform.question.persisted?).to be true
    expect(@validform.question.answer.persisted?).to be true
    expect(@validform.question.draft.persisted?).to be true
  end

  it 'cannot save invalid parameters' do 
    expect(@invalidform.save).to be false
    expect(@invalidform.errors.count).to eq(4)
  end

  it 'can update a question' do 
    expect(@existingform.question.persisted?).to be true

    old = Question.find(@existingform.params.question[:id])
    old.update_attribute(:subtopic_id, Subtopic.where.not(id: old.subtopic_id).first.id)

    expect(@existingform.question.subtopic_id).not_to eq(old.id)
    expect(@existingform.save).to be true
    expect(@existingform.question.subtopic_id).not_to eq(old.id)
  end
end