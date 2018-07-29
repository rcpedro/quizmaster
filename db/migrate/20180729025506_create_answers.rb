class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, null: false, index: true
      t.string     :value,    null: false

      t.string :created_by, null: false
      t.string :updated_by, null: false
      
      t.timestamps
    end
  end
end
