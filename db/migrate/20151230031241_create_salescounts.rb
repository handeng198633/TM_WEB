class CreateSalescounts < ActiveRecord::Migration
  def change
    create_table :salescounts do |t|
      t.string :name
      t.integer :amount
      t.integer :person_number
      t.integer :profit
      t.integer :received
      t.integer :noreceived

      t.timestamps null: false
    end
  end
end
