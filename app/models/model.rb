class Model < ApplicationRecord
  belongs_to :brand
  has_many :orders
  
  validates :title, presence: true
  
  scope :ordered_by_title, -> {includes(:brand).order('brands.title', 'models.title')}
  
  def title_with_brand
    [brand.title, title].join(' ')
  end  
  
  def self.search(search)
    if search
      includes(:brand).where('models.title LIKE ? OR brands.title LIKE ?', "%#{search}%", "%#{search}%")
    else
      Model.includes(:brand).all
    end
  end   
end
