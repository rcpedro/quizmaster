class Course < ApplicationRecord
  has_many :topics
  has_many :subtopics, through: :topics
  has_many :questions, through: :subtopics

  validates :code, :name, presence: true
end
