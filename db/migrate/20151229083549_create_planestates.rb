class CreatePlanestates < ActiveRecord::Migration
  def change
    create_table :planestates do |t|
      t.text :stateinfo
      t.datetime :start_time

      t.timestamps null: false
    end
  end
end
