# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

english = Course.find_or_create_by!(
  code: 'ENGLIT', name: 'English Literature', 
  description: 'Explore a wide range of texts dating from a variety of periods.'
)

art = Course.find_or_create_by!(
  code: 'ARTINTRO', name: 'Art Introduction', 
  description: 'Get an easy introduction to the visual arts or just consolidate your basic knowledge.'
)

math = Course.find_or_create_by!(
  code: 'MATH', name: 'Mathematics',
  description: 'Get introductions to algebra, geometry, trigonometry, precalculus and calculus.'
)

arithmetic = Topic.find_or_create_by!(
  course: math, code: 'ARITH', name: 'Arithmetic', 
  description: 'Learn addition, subtraction, multiplication, division and many more!'
)

addition = Subtopic.find_or_create_by!(
  topic: arithmetic, code: 'ADD', name: 'Addition',
  description: 'Calculate the total of two or more numbers or amounts.'
)

subtract = Subtopic.find_or_create_by!(
  topic: arithmetic, code: 'SUBTRACT', name: 'Subtraction',
  description: 'Calculate the difference between two or more numbers or amounts.'
)

multiply = Subtopic.find_or_create_by!(
  topic: arithmetic, code: 'MULTIPLy', name: 'Multiplication',
  description: 'Calculate multiple additions.'
)

divide = Subtopic.find_or_create_by!(
  topic: arithmetic, code: 'DIVIDE', name: 'Division',
  description: 'Calculate how to divide numbers.'
)

guest = User.find_or_initialize_by(
  email: 'guest@quizmaster.com',
  username: 'guest',
  firstname: 'Guest',
  lastname: 'User'
)
guest.password = 'QuizMaster'
guest.password_confirmation = 'QuizMaster'
guest.save!


q1 = ActionController::Parameters.new({
  question: { subtopic_id: addition.id, type: 'Questions::OpenResponse', status: 1 },
  answer: { value: '2' },
  content: { markdown: '1 + 1 = ?' }
})
QuestionForm.new(q1).create

q2 = ActionController::Parameters.new({
  question: { subtopic_id: addition.id, type: 'Questions::OpenResponse', status: 1 },
  answer: { value: '2' },
  content: { markdown: 'John and Amy have *two* apples each. John decided to give Amy *one* of his apples. How many apples does Amy have?' }
})
QuestionForm.new(q2).create

q3 = ActionController::Parameters.new({
  question: { subtopic_id: addition.id, type: 'Questions::MultipleChoice', status: 1 },
  choices: [
    { value: '4', correct: true }, 
    { value: '3', correct: false },
    { value: '5', correct: false }
  ],
  content: { markdown: '1 + ? = 5' }
})
QuestionForm.new(q3).create

no_of_questions = Option.find_or_create_by!(id: 1, code: 'no_of_questions', name: 'Question Count', description: 'Customize the no. of questions per quiz.', type: 'Options::QuestionCount')
subtopic = Option.find_or_create_by!(id: 2, code: 'subtopic', name: 'Specialize', description: 'Select the subtopics you would like to specialize in.', type: 'Options::Subtopic')



