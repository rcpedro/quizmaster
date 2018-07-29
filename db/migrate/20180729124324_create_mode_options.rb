class CreateModeOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :mode_options do |t|

      t.timestamps
    end
  end
end
