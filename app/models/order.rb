class Order < ApplicationRecord
  belongs_to :model
  belongs_to :warehouse
  belongs_to :client
  belongs_to :user
  
  # job types
  PAY_TYPE = 0
  GARANTY_TYPE = 1
  
  def type
    job_type.zero? ? 'Платный' : 'Гарантийный'
  end  
end
