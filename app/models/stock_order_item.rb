class StockOrderItem < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :stock_location
  belongs_to :order
  has_many :stock_order_movements
  
  validates :stock_location, :order, presence: true
  
  validates :count_on_hand, numericality: {
                              greater_than_or_equal_to: 0,
                              less_than_or_equal_to: 1,
                              only_integer: true }
                              

  def adjust_count_on_hand(value)
    self.with_lock do
      set_count_on_hand(count_on_hand + value)
    end
  end

  def set_count_on_hand(value)
    self.count_on_hand = value
    self.save!
  end

  def in_stock?
    self.count_on_hand > 0
  end

  def available?
    self.in_stock?
  end

  def reduce_count_on_hand_to_zero
    self.set_count_on_hand(0) if count_on_hand > 0
  end                            
end
