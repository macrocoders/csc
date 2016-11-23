class Warehouse < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :title, uniqueness: true
  
  scope :ordered, -> {order(:created_at)}
end
