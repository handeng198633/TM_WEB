class CreateLinelists < ActiveRecord::Migration
  def change
    create_table :linelists do |t|
      t.integer :line_id
      t.string :group_number
      t.integer :day
      t.string :linename
      t.string :line_info
      t.text :travel_content
      t.text :picture
      t.text :document
      t.string :price
      t.string :record_person
      t.string :selling_ornot

      t.timestamps null: false
    end
    add_index :linelists, [:line_id, :created_at]
  end
end
