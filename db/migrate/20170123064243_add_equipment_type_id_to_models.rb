class AddEquipmentTypeIdToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :equipment_type_id, :integer
  end
end
