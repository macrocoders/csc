class Client < ApplicationRecord  
  paginates_per 20
  
  has_many :orders
  
  validates :name, presence: true
  
  scope :ordered_by_name, -> {order(:name)}
  
  #legal status
  NATURAL_PERSON_STATUS = 0
  LEGAL_ENTITY_STATUS = 1
  
  PAGINATES_PER = 20 
  
  def legal_status_s
    legal_status.zero? ? 'Физ. лицо' : 'Юр. лицо'
  end
    
  def address
    [city, street, hous, flat].join(', ')
  end
  
  def self.search(search)
    if search
      where('LOWER(name) LIKE ?', "%#{search.downcase}%")
    else
      Client.all
    end
  end     
end
