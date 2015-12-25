class CreateNetprofits < ActiveRecord::Migration
  def change
    create_table :netprofits do |t|
      t.datetime :month
      t.string :total_income
      t.string :total_coat
      t.string :profit
      t.string :fax
      t.string :net_profit
      t.boolean :status, default: false

      t.timestamps null: false
    end
    add_index :netprofits, :month, unique: true
  end
end
