class StockLocation < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :stock_order_items
  
  validates :name, presence: true
  validates :name, uniqueness: true
  
  scope :ordered, -> {order(:created_at)}
  
  after_create :create_order_stock_items
  
  def propagate_order(order)
     self.stock_order_items.create!(order: order)
  end
  
  def stock_order_item(order_id)
    stock_order_items.where(order_id: order_id).order(:id).first
  end
  
  def stock_order_item_or_create(order)
    stock_order_item(order) || stock_order_items.create(order_id: order.id)
  end

  def count_on_hand(order)
    stock_order_item(order).try(:count_on_hand)
  end


  def restock(order, quantity, originator = nil)
    move(order, quantity, originator)
  end

  def unstock(order, quantity, originator = nil)
    move(order, -quantity, originator)
  end

  def move(order, quantity, originator = nil)
    stock_order_item_or_create(order).stock_order_movements.create!(quantity: quantity,
                                                        originator: originator)
  end  
  
  private 
    def create_order_stock_items
      Order.find_each do |order|
        propagate_order(order)
      end
    end
end
