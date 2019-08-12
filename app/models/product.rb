class Product < ApplicationRecord
  has_many  :product_images, dependent: :delete_all
  belongs_to :status
  belongs_to :condition  
end
