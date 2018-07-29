class CreateSessionQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :session_question_answers do |t|
      t.references :session_question, null: false, index: true
      t.string     :response
      
      t.timestamps
    end
  end
end
