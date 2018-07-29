class Subtopic < ApplicationRecord
  belongs_to :topic
  has_one :course, through: :topic
  has_many :questions

  validates :code, :name, presence: true
  validates :code, uniqueness: { scope: :topic }
end
