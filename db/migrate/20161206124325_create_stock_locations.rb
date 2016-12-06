class CreateStockLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_locations do |t|
      t.string :name
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
