module ClientsHelper
  def legal_statuses
    [['Физ. лицо', Client::NATURAL_PERSON_STATUS], ['Юр. лицо', Client::LEGAL_ENTITY_STATUS]]
  end  
end
