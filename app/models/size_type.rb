class SizeType < ApplicationRecord
  has_one :category
  has_many :sizes
end
