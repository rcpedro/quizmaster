class DenormalizeQuestionSubtopicAndCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :topic, index: true, null: false
    add_reference :questions, :course, index: true, null: false
  end
end
