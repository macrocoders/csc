class AddDeletedAtToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :deleted_at, :timestamp
  end
end
