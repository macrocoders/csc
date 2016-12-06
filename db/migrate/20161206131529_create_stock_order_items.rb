class CreateStockOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_order_items do |t|
      t.references :stock_location, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :count_on_hand, default: 0
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
