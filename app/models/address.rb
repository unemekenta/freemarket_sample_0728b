class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :post_number, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street, presence: true

end
