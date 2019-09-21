class Purchase < ApplicationRecord
  belongs_to  :product
  belongs_to  :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to  :seller, class_name: 'User', foreign_key: 'seller_id'

  validates :product, presence: true
  validates :buyer, presence: true
  validates :seller, presence: true
  validate :buyer_is_not_seller

  def buyer_is_not_seller
    if buyer == seller
      errors.add(:buyer, "エラー発生")
    end
  end
end
