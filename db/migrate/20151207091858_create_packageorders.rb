class CreatePackageorders < ActiveRecord::Migration
  def change
    create_table :packageorders do |t|
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
      t.boolean :package_ornot, default: false
      t.string :sales

      t.timestamps null: false
    end
  end
end
