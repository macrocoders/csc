class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  
  has_one :warehouse
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  scope :ordered, -> {order(:created_at)}
  
  def full_name
    [first_name, last_name].join(' ')
  end  
end
