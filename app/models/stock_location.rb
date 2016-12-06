class StockLocation < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :name, uniqueness: true
  
  scope :ordered, -> {order(:created_at)}
end
