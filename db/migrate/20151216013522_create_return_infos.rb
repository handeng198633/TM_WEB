class CreateReturnInfos < ActiveRecord::Migration
  def change
    create_table :return_infos do |t|
      t.string :category
      t.string :content
      t.string :remark
      t.boolean :state,  default: false

      t.timestamps null: false
    end
    add_index :return_infos, :created_at
  end
end
