class AddIsEngineerStockToStockLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :stock_locations, :is_engineer_stock, :boolean, default: false
  end
end
