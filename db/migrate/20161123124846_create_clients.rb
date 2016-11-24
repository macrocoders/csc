class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :additional_phone
      t.string :email
      t.string :address
      t.integer :legal_status, default: 0
      t.boolean :is_buyer
      t.boolean :is_supplier    

      t.timestamps
    end
  end
end
