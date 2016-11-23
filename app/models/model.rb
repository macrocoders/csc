class Model < ApplicationRecord
  belongs_to :brand
  
  validates :title, presence: true
end
