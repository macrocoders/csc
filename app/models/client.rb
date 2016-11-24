class Client < ApplicationRecord
  validates :name, presence: true
  
  #legal status
  NATURAL_PERSON_STATUS = 0
  LEGAL_ENTITY_STATUS = 1 
  
  def legal_status_s
    legal_status.zero? ? 'Физ. лицо' : 'Юр. лицо'
  end   
end
