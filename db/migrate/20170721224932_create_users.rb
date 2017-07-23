class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.string :name
      t.boolean :is_teacher, default: false
      t.boolean :is_admin, default: false

      t.timestamps null: false
    end
    add_index :users, :email
    add_index :users, :remember_token
  end
end
