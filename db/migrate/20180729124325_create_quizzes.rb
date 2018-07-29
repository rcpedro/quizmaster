class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :student, null: false, index: true, foreign_key: { to_table: :users }
      t.references :course,  null: false, index: true
      t.references :quizmode, 
      t.timestamps
    end
  end
end
