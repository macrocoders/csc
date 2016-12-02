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
  belongs_to :warehouse
  belongs_to :client
  belongs_to :user
  
  # job types
  PAY_TYPE = 0
  GARANTY_TYPE = 1
  
  scope :ordered, -> {order('created_at DESC')}
  
  def type
    job_type.zero? ? 'Платный' : 'Гарантийный'
  end  
end
