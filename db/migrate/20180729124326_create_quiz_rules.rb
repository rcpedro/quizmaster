class CreateQuizRules < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_rules do |t|
      t.references :quiz, null: false, index: true
      t.string     :type, null: false, index: true
      t.timestamps
    end
  end
end
