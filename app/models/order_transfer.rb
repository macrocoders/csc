class OrderTransfer < ApplicationRecord
  belongs_to :order
  belongs_to :user
  
  belongs_to :source_location, class_name: 'StockLocation'
  belongs_to :destination_location, class_name: 'StockLocation'
  
  after_create :update_ordes_stock_location
  
  private
  
  def update_ordes_stock_location
    order.update_attribute(:current_stock_location, destination_location)
  end  
end
