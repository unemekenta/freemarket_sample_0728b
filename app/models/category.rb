class Category < ApplicationRecord
  belongs_to :size_type
  has_many :products
end
