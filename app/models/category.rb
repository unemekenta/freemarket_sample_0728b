class Category < ApplicationRecord
  belongs_to :size_type, optional: true
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id
  has_many :products
end
