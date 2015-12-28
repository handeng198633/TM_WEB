class CreateNetprofits < ActiveRecord::Migration
  def change
    create_table :netprofits do |t|
      t.text :month
      t.integer :total_income
      t.integer :total_coat
      t.integer :profit
      t.integer :fax
      t.integer :net_profit
      t.boolean :status, default: false

      t.timestamps null: false
    end
    add_index :netprofits, :month, unique: true
  end
end