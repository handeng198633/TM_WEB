class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :contact_info
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin

      t.timestamps null: false
    end
    add_index :users, :name, unique: true
  end
end
