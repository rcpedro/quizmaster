class CreateModeRules < ActiveRecord::Migration[5.2]
  def change
    create_table :mode_rules do |t|

      t.timestamps
    end
  end
end
