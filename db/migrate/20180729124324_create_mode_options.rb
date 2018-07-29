class CreateModeOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :mode_options do |t|
      t.references :mode,   null: false, index: true
      t.references :option, null: false, index: true
      t.timestamps
    end
  end
end
