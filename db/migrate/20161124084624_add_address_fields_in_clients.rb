class AddAddressFieldsInClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :address
    
    add_column :clients, :city, :string, limit: 100
    add_column :clients, :street, :string, limit: 100
    add_column :clients, :hous, :string, limit: 20
    add_column :clients, :flat, :string, limit: 20 
  end
end
