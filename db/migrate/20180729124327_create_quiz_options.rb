class CreateQuizOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_options do |t|
      t.references :quiz,   null: false, index: true
      t.references :option, null: false, index: true
      t.json       :config
      t.timestamps
    end
  end
end
