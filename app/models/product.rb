class Product < ApplicationRecord
has_many :users, through: :likes
has_many :users, through: :messages
has_many :users, through: :todoes
has_many :users, through: :transactions
has_many :users, through: :purchases
has_many :product_images
has_one :category
has_one :status
has_one :condition
accepts_nested_attributes_for :product_images
has_one :delivery
end
