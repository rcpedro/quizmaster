class CreateModes < ActiveRecord::Migration[5.2]
  def change
    create_table :modes do |t|
      t.string :code,        null: false
      t.string :name,        null: false
      t.string :description, null: false
      t.json   :config
      t.string :type

      t.timestamps
    end
  end
end
