module ClientsHelper
  def legal_statuses
    [['Физ. лицо', Client::NATURAL_PERSON_STATUS], ['Юр. лицо', Client::LEGAL_ENTITY_STATUS]]
  end
  
  def client_action_links(client_id)
    [content_tag(:li, link_to('Редактировать', edit_references_client_path(client_id)))].join.html_safe
  end    
end
