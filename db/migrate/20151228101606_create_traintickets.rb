class CreateTraintickets < ActiveRecord::Migration
  def change
    create_table :traintickets do |t|
      t.string :category
      t.string :order_id
      t.string :number
      t.datetime :outdate
      t.string :travel_content
      t.string :combined_transport
      t.string :place
      t.string :person_name
      t.string :person_idcard
      t.string :ticket_cost
      t.string :difficulty
      t.string :seat1
      t.string :seat2
      t.string :remark
      t.string :record_person
      t.string :record_remark
      t.boolean :state, default: false
      t.string :state_step #send, out, get, exit

      t.timestamps null: false
    end
    add_index :traintickets, :created_at
  end
end