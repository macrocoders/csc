class RemoveWarehouseIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :warehouse_id
  end
end
