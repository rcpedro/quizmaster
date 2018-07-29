class CreateSessionQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :session_questions do |t|
      t.references :question,  null: false, index: true
      t.references :session,   null: false, index: true
      
      t.timestamps
    end

    add_index :session_questions, [:question_id, :session_id], unique: true
  end
end
