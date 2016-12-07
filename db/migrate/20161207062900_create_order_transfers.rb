class CreateOrderTransfers < ActiveRecord::Migration[5.0]
  def change
    create_table :order_transfers do |t|
      t.references :order, foreign_key: true
      t.integer :source_location_id
      t.integer :destination_location_id
      t.references :user, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
