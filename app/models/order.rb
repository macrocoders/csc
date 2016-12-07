class Order < ApplicationRecord
  include AASM
  acts_as_paranoid
  
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
  belongs_to :current_stock_location, class_name: 'StockLocation'
  
  after_create :set_current_stock_location
  
  # job types
  PAY_TYPE = 0
  GARANTY_TYPE = 1
  
  scope :ordered, -> {order('created_at DESC')}
  
  def type
    job_type.zero? ? 'Платный' : 'Гарантийный'
  end
  
  private 
  
  def set_current_stock_location
    self.update_attribute(:current_stock_location, stock_location)
  end  
end
