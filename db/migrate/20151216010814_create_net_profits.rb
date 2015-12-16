class CreateNetProfits < ActiveRecord::Migration
  def change
    create_table :net_profits do |t|
      t.datetime :month
      t.string :total_income
      t.string :total_coat
      t.string :profit
      t.string :fax
      t.string :net_profit
      t.boolean :status, default: false

      t.timestamps null: false
    end
    add_index :net_profits, :month, unique: true
  end
end
