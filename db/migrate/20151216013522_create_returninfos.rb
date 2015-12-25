class CreateReturninfos < ActiveRecord::Migration
  def change
    create_table :returninfos do |t|
      t.string :category
      t.string :content
      t.string :remark
      t.boolean :state,  default: false

      t.timestamps null: false
    end
    add_index :returninfos, :created_at
  end
end
