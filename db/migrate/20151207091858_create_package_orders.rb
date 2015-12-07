class CreatePackageOrders < ActiveRecord::Migration
  def change
    create_table :package_orders do |t|
      t.integer :order_id
      t.string :group_number
      t.datetime :outdate
      t.datetime :returndate
      t.text :travel_agency
      t.string :person_list
      t.text :travel_content
      t.integer :price1
      t.integer :price2
      t.integer :price3
      t.integer :price4
      t.text :out_tracffic
      t.text :return_tracffic
      t.integer :cost
      t.string :package_ornot
      t.string :sales

      t.timestamps null: false
    end
    add_index :package_orders, [:order_id, :created_at]
  end
end
