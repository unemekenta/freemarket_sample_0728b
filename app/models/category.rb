class Category < ApplicationRecord
  belongs_to :size_type, optional: true
  has_many :products
end
