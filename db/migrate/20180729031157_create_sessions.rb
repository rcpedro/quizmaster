class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :student, null: false, index: true, foreign_key: { to_table: :users }
      t.datetime   :start,   null: false
      t.datetime   :end
      t.integer    :status,  null: false, default: 0
      
      t.timestamps
    end
  end
end
