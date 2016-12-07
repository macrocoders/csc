class OrderTransfer < ApplicationRecord
  belongs_to :order
  belongs_to :user
  
  belongs_to :source_location, class_name: 'StockLocation'
  belongs_to :destination_location, class_name: 'StockLocation'
  
  after_create :update_order_current_stock_location, 
               :change_order_work_status
  
  has_many :order_status_changes, as: :originator             
  
  private
  
  def update_order_current_stock_location
    order.update_attribute(:current_stock_location, destination_location)
  end
  
  def change_order_work_status
    #work only if order status is accepted
    if order.transfer_to_engineer!
      order.status_changes.create(status: order.work_status, originator: self)
    end   
  end    
end
