class CreateStockOrderMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_order_movements do |t|
      t.references :stock_order_item, foreign_key: true
      t.integer :quantity
      t.integer :originator_id
      t.string :originator_type

      t.timestamps
    end
  end
end
