class StockLocation < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :stock_items
  
  validates :name, presence: true
  validates :name, uniqueness: true
  
  scope :ordered, -> {order(:created_at)}
  
  #after_create :create_stock_items
  
  def propagate_product(product)
     self.stock_items.create!(product: product)
  end
  
  def stock_item(product_id)
    stock_items.where(product_id: product_id).order(:id).first
  end
  
  def stock_item_or_create(product)
    stock_item(product) || stock_items.create(prodcut_id: product.id)
  end

  def count_on_hand(product)
    stock_item(product).try(:count_on_hand)
  end

  def restock(product, quantity, originator = nil)
    move(product, quantity, originator)
  end

  def unstock(product, quantity, originator = nil)
    move(product, -quantity, originator)
  end

  def move(product, quantity, originator = nil)
    stock_item_or_create(product).stock_movements.create!(quantity: quantity,
                                                          originator: originator)
  end  
  
  private 
    def create_stock_items
      Product.find_each do |product|
        propagate_product(product)
      end
    end
end
