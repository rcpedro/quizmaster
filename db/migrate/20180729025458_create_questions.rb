class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :course,   null: false, index: true
      t.references :topic,    null: false, index: true
      t.references :subtopic, null: false, index: true
      t.references :author,   null: false, index: true, foreign_key: { to_table: :users }
      t.integer    :status,   null: false, index: true, default: 0
      t.string     :type,     null: false, index: true

      t.string :created_by, null: false
      t.string :updated_by, null: false

      t.timestamps
    end
  end
end
