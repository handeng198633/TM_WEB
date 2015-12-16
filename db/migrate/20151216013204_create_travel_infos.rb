class CreateTravelInfos < ActiveRecord::Migration
  def change
    create_table :travel_infos do |t|
      t.string :category
      t.string :content
      t.string :remark
      t.boolean :state, default: false

      t.timestamps null: false
    end
    add_index :travel_infos, :created_at
  end
end
