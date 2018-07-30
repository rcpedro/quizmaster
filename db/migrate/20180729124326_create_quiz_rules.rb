class CreateQuizRules < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_rules do |t|
      t.references :quiz, null: false, index: true
      t.references :rule, null: false, index: true
      t.json       :config
      t.timestamps
    end
  end
end
