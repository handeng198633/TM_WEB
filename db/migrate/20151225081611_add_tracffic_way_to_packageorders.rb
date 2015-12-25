class AddTracfficWayToPackageorders < ActiveRecord::Migration
  def change
    add_column :packageorders, :out_tracffic_way, :string
    add_column :packageorders, :return_tracffic_way, :string
  end
end
