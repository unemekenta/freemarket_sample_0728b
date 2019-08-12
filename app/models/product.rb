class Product < ApplicationRecord
  has_many  :product_images, dependent: :delete_all
  has_one :status
  has_one :condition  
end
