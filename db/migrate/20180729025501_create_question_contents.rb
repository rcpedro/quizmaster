class CreateQuestionContents < ActiveRecord::Migration[5.2]
  def change
    create_table :question_contents do |t|
      t.references :question, null: false, index: true
      t.integer    :status,   null: false, index: true, default: 0
      t.text       :markdown

      t.string :created_by, null: false
      t.string :updated_by, null: false

      t.timestamps
    end
  end
end
