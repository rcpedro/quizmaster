require 'rails_helper'

RSpec.describe 'Course Query' do
  subject { CourseQuery.new }

  it 'finds all courses' do 
    expect(subject.list({}).count).to eq(Course.count) 
  end

  it 'finds a course by code' do 
    result = subject.list({ code: 'math' })
    expect(result.first.code).to eq('MATH') 
    expect(result.count).to eq(1)
  end

  it 'finds a course by name' do 
    result = subject.list({ name: 'maTh' })
    expect(result.first.code).to eq('MATH')
    expect(result.count).to eq(1)
  end

  it 'finds a course by description' do 
    result = subject.list({ description: 'algebra' })
    expect(result.first.code).to eq('MATH') 
    expect(result.count).to eq (1)
  end

  it 'finds no courses by code' do 
    result = subject.list({ code: 'GERMANLIT' })
    expect(result.count).to eq(0)
  end

  it 'finds no courses by name' do 
    result = subject.list({ name: 'german' })
    expect(result.count).to eq(0)
  end

  it 'finds no courses by description' do 
    result = subject.list({ description: 'german' })
    expect(result.count).to eq(0)
  end
end
