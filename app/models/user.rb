class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  has_one :deliver_address
  accepts_nested_attributes_for :address, :deliver_address

  has_many :products, through: :purchases
  has_many :purchases  
end
