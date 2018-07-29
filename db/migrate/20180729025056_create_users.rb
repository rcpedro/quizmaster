class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,     null: false, index: { unique: true }
      t.string :username,  null: false, index: { unique: true }
      t.string :firstname, null: false
      t.string :lastname,  null: false
      
      t.string :password_digest, null: false

      t.string :created_by, null: false
      t.string :updated_by, null: false

      t.timestamps
    end
  end
end
