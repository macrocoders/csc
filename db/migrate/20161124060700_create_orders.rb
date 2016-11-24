class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :client, foreign_key: true
      t.references :warehouse, foreign_key: true
      t.integer :job_type, default: 0
      t.references :model, foreign_key: true
      t.string :imei
      t.string :serial_number
      t.string :defect
      t.string :completeness
      t.string :appearance
      t.text :description
      
      t.timestamps
    end
  end
end
