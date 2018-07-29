class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :quiz,    null: false, index: true
      t.datetime   :start,   null: false
      t.datetime   :end
      t.integer    :status,  null: false, default: 0
      
      t.timestamps
    end
  end
end
