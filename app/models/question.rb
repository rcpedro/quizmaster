class Question < ApplicationRecord
  belongs_to :subtopic
  belongs_to :topic
  belongs_to :course
  belongs_to :author, class_name: 'User'

  has_one :draft,     -> { draft },     class_name: 'QuestionContent'
  has_one :published, -> { published }, class_name: 'QuestionContent'

  has_many :question_contents

  enum status: [:draft, :published]

  validates :status, :subtopic, presence: true
  before_validation :denormalize_topic_and_course

  protected
    def denormalize_topic_and_course
      return if not self.subtopic
      
      self.topic = self.subtopic.topic
      self.course = self.topic.course
    end
end
