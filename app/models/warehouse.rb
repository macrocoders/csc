class Warehouse < ApplicationRecord
  belongs_to :user
  has_many :orders
  
  validates :title, presence: true
  validates :title, uniqueness: true
  
  scope :ordered, -> {order(:created_at)}
end
