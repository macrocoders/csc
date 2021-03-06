class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  
  has_one :stock_location
  has_many :orders
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  scope :ordered, -> {order(:created_at)}
  scope :ordered_by_name, -> {order(:last_name, :first_name)}
  
  def full_name
    [first_name, last_name].join(' ')
  end    
end
