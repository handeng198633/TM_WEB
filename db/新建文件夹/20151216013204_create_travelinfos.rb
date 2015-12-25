class CreateTravelinfos < ActiveRecord::Migration
  def change
    create_table :travelinfos do |t|
      t.string :category
      t.string :content
      t.string :remark
      t.boolean :state, default: false

      t.timestamps null: false
    end
    add_index :travelinfos, :created_at
  end
end
