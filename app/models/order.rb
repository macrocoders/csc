class Order < ApplicationRecord
  include AASM
  acts_as_paranoid
  
  aasm column: 'work_status' do
    state :accepted, initial: true
    state :transferred_to_engineer
    state :received_from_the_engineer
    state :diagnosed
    
    event :transfer do
      transitions from: %w(accepted received_from_the_engineer), to: :transferred_to_engineer, if: :order_moved_to_engineer?
      transitions from: :transferred_to_engineer, to: :received_from_the_engineer, unless: :order_moved_to_engineer?
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
  belongs_to :current_stock_location, class_name: 'StockLocation'
  
  has_many :status_changes, class_name: 'OrderStatusChange'
  has_many :transfers, class_name: 'OrderTransfer'
  
  after_create :set_current_stock_location, :create_status_change
  
  # job types
  PAY_TYPE = 0
  GARANTY_TYPE = 1
  
  scope :ordered, -> {order('created_at DESC')}
  
  def type
    job_type.zero? ? 'Платный' : 'Гарантийный'
  end
  
  private
  
  def order_moved_to_engineer?
    current_stock_location.is_engineer_stock  
  end 
  
  def set_current_stock_location
    self.update_attribute(:current_stock_location, stock_location)
  end
  
  def create_status_change
    status_changes.create(status: work_status, originator: self)
  end    
end
