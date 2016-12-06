class Order < ApplicationRecord
  include AASM
  
  aasm column: 'work_status' do
    state :accepted, initial: true
    state :transferred_to_engineer
    state :diagnosed
    
    event :transfer_to_engineer do
      transitions from: :accepted, to: :transferred_to_engineer
    end
  end

  #aasm column: 'payment_status' do
  #  state :not_paid, initial: true
  #  state :partially_paid
  #  state :fully_paid
  #end
  
  paginates_per 50
  
  belongs_to :model
  belongs_to :client
  belongs_to :user
  belongs_to :stock_location
  
  with_options inverse_of: :order do
    has_many :stock_order_items, dependent: :destroy
  end

  with_options through: :stock_items do
    #has_many :stock_locations
    has_many :stock_order_movements
  end
  
  after_create :create_order_stock_items
  
  # job types
  PAY_TYPE = 0
  GARANTY_TYPE = 1
  
  scope :ordered, -> {order('created_at DESC')}
  
  def type
    job_type.zero? ? 'Платный' : 'Гарантийный'
  end
  
  private 
  
  def create_order_stock_items
    StockLocation.find_each do |stock_location|
      stock_location.propagate_order(self)
    end
  end  
end
