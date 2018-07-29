class Topic < ApplicationRecord
  belongs_to :course
  has_many :subtopics
  has_many :questions, through: :subtopics

  validates :code, :name, presence: true
  validates :code, uniqueness: { scope: :course_id } 
end
