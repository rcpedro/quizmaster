class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :description

      t.string :created_by, null: false
      t.string :updated_by, null: false
      
      t.timestamps
    end
  end
end
