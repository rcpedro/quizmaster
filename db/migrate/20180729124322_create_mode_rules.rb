class CreateModeRules < ActiveRecord::Migration[5.2]
  def change
    create_table :mode_rules do |t|
      t.references :mode, null: false, index: true
      t.references :rule, null: false, index: true
      t.timestamps
    end
  end
end
