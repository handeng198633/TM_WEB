class CreatePlanetickets < ActiveRecord::Migration
  def change
    create_table :planetickets do |t|
      t.string :category
      t.string :order_id
      t.string :number
      t.datetime :outdate
      t.string :travel_content
      t.string :combined_transport
      t.string :place
      t.string :person_name
      t.string :person_idcard
      t.datetime :valid_date
      t.datetime :born_date
      t.string :ticket_cost
      t.string :counter_cost
      t.string :plane
      t.string :remark
      t.string :record_person
      t.string :record_remark
      t.boolean :state, default: false
      t.string :state_step

      t.timestamps null: false
    end
    add_index :planetickets, :created_at
  end
end
