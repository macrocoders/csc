class Model < ApplicationRecord
  paginates_per 20
  
  belongs_to :brand
  belongs_to :equipment_type
  has_many :orders
  
  validates :title, presence: true
  
  scope :ordered_by_title, -> {includes(:brand).order('equipment_types.title', 'brands.title', 'models.title')}
  
  def title_with_brand
    [brand.title, title].join(' ')
  end
  
  def brand_title
    brand.present? ? brand.title : ''
  end 
  
  def equipment_type_title
    equipment_type.present? ? equipment_type.title : ''
  end     
    
  def self.search(search)
    if search
      includes(:brand, :equipment_type).where('LOWER(models.title) LIKE ? OR LOWER(brands.title) LIKE ? OR LOWER(equipment_types.title) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
    else
      Model.includes(:brand, :equipment_type).all
    end
  end   
end
