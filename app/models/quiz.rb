class Quiz < ApplicationRecord
  belongs_to :student, class_name: 'User'
  has_many :quiz_options
  has_many :options, through: :quiz_options
end
