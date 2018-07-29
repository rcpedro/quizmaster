class CreateSubtopics < ActiveRecord::Migration[5.2]
  def change
    create_table :subtopics do |t|
      t.references :topic, null: false, index: true

      t.string :code, null: false, index: true
      t.string :name, null: false
      t.string :description

      t.string :created_by, null: false
      t.string :updated_by, null: false

      t.timestamps
    end

    add_index :subtopics, [:topic_id, :code], unique: true
  end
end
