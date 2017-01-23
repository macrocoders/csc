module EquipmentTypesHelper
  def equipment_type_action_links(equipment_type)
    [content_tag(:li, link_to('Редактировать', edit_references_equipment_type_path(equipment_type)))].join.html_safe
  end
end
