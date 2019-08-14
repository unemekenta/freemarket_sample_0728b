class Product < ApplicationRecord
  has_many :product_images
  belongs_to :condition
  belongs_to :status
end
