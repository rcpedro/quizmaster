class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :name,        null: false
      t.string :description, null: false
      t.string :type,        null: false, index: true
      
      t.timestamps
    end
  end
end
