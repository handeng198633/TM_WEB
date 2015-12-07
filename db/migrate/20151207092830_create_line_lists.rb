class CreateLineLists < ActiveRecord::Migration
  def change
    create_table :line_lists do |t|
      t.integer :line_id
      t.string :group_number
      t.integer :day
      t.string :linename
      t.string :line_info
      t.text :travel_content
      t.integer :picture_id
      t.integer :document_id
      t.string :price
      t.string :record_person
      t.string :selling_ornot

      t.timestamps null: false
    end
    add_index :line_lists, [:line_id, :created_at]
  end
end
