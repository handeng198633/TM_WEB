class CreateTicketstates < ActiveRecord::Migration
  def change
    create_table :ticketstates do |t|
      t.string :stateinfo
      t.datetime :start_time

      t.timestamps null: false
    end
  end
end
