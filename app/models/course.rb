class Course < ApplicationRecord
  include Codeable
  
  has_many :topics
  has_many :subtopics, through: :topics
  has_many :questions, through: :subtopics

  validates :code, :name, presence: true
  validates :code, uniqueness: true
end
