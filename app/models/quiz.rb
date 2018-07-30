class Quiz < ApplicationRecord
  belongs_to :student, class_name: 'User'
  has_many :quiz_options
  has_many :options, through: :quiz_options

  def questions
    result = Question.where(nil)
    self.quiz_options.each do |quiz_opt|
      result = quiz_opt.option.filter(result, quiz_opt.config)
    end
    return result
  end
end
