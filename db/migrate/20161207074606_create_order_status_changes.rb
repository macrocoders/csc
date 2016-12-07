class CreateOrderStatusChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :order_status_changes do |t|
      t.references :order, foreign_key: true
      t.string :previous_status
      t.string :status
      t.integer :originator_id
      t.string :originator_type

      t.timestamps
    end
  end
end
