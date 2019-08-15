class Product < ApplicationRecord
  has_many :users, through: :likes
  has_many :users, through: :messages
  has_many :users, through: :todoes
  has_many :users, through: :transactions
  has_many :users, through: :purchases
  has_many :product_images
  has_one :category
  belongs_to :status
  belongs_to :condition
  has_one :delivery
  accepts_nested_attributes_for :product_images, :delivery
end
