class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  has_one :deliver_address
  accepts_nested_attributes_for :address, :deliver_address

  validates :password, presence: true, length: { minimum: 7 }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_pseudonym, presence: true
  validates :first_name_pseudonym, presence: true
  validates :birthday, presence: true
end
