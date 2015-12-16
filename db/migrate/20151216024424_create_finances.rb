class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.datetime :out_date
      t.datetime :package_date
      t.string :content
      t.string :travel_agency
      t.integer :person_number
      t.string :price4_person
      t.integer :should
      t.integer :received
      t.integer :balance
      t.string :remark

      t.timestamps null: false
    end
    add_index :finances, :created_at
  end
end
