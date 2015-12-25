class CreateFitorders < ActiveRecord::Migration
  def change
    create_table :fitorders do |t|
      t.integer :order_id
      t.string :group_number
      t.datetime :outdate
      t.datetime :returndate
      t.string :bookinfo
      t.text :info
      t.string :persons_list
      t.text :comeinfo
      t.text :goinfo
      t.integer :price1
      t.integer :price2
      t.integer :price3
      t.integer :price4
      t.text :customers_info
      t.string :tip
      t.string :recipient
      t.integer :current_collction
      t.string :status

      t.timestamps null: false
    end
    add_index :fitorders, [:order_id, :created_at]
  end
end
