class Brand < ApplicationRecord
  has_many :models
  
  validates :title, presence: true
  
  scope :ordered_by_title, -> {order(:title)}
end
