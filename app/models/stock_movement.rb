class StockMovement < ApplicationRecord
  QUANTITY_LIMITS = {
      max: 2**31 - 1,
      min: -2**31
    }.freeze

  belongs_to :stock_item
  belongs_to :originator, polymorphic: true

  after_create :update_stock_item_quantity

  with_options presence: true do
    validates :stock_order_item
    validates :quantity, numericality: {
        greater_than_or_equal_to: QUANTITY_LIMITS[:min],
        less_than_or_equal_to: QUANTITY_LIMITS[:max],
        only_integer: true,
        allow_nil: true
      }
  end

  private

  def update_stock_item_quantity
    stock_order_item.adjust_count_on_hand quantity
  end
end
