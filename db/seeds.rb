# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

english = Course.find_or_create_by!(
  code: 'englit', name: 'English Literature', 
  description: 'Explore a wide range of texts dating from a variety of periods.'
)

french = Course.find_or_create_by!(
  code: 'artintro', name: 'Art Introduction', 
  description: 'Get an easy introduction to the visual arts or just consolidate your basic knowledge.'
)

math = Course.find_or_create_by!(
  code: 'math', name: 'Mathematics',
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

