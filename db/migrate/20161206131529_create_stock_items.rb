class CreateStockItems < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_items do |t|
      t.references :stock_location, foreign_key: true
      #t.references :product, foreign_key: true
      t.integer :count_on_hand, default: 0
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
