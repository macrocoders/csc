class Client < ApplicationRecord
  has_many :orders
  
  validates :name, presence: true
  
  scope :ordered_by_name, -> {order(:name)}
  
  #legal status
  NATURAL_PERSON_STATUS = 0
  LEGAL_ENTITY_STATUS = 1 
  
  def legal_status_s
    legal_status.zero? ? 'Физ. лицо' : 'Юр. лицо'
  end
  
  def address
    [city, street, hous, flat].join(', ')
  end
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      Client.all
    end
  end     
end
