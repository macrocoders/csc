class OrderStatusChange < ApplicationRecord
  belongs_to :order
  belongs_to :originator, polymorphic: true
end
