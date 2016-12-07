class AddStockLocationIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :stock_location_id, :integer
    add_column :orders, :current_stock_location_id, :integer
    add_index :orders, :stock_location_id
    add_index :orders, :current_stock_location_id
  end
end
