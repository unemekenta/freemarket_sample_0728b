class Product < ApplicationRecord
  has_many :users, through: :likes
  has_many :users, through: :messages
  has_many :users, through: :todoes
  has_many :users, through: :transactions
  has_many :product_images, dependent: :destroy
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :status
  belongs_to :condition
  has_one :delivery, dependent: :destroy
  accepts_nested_attributes_for :product_images, :delivery, allow_destroy: true
  has_many :users, through: :purchases
  has_many :comments
  has_many :purchases
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 9999999 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :status_id, presence: true
  validates :condition_id, presence: true
  validates :category_id, presence: true
  validates :seller_id, presence: true
  
  validate :product_product_images_number

  def product_product_images_number
    errors.add(:product_images, "を1枚以上投稿してください") if product_images.size < 1
    errors.add(:product_images, "は10枚までしか投稿できません") if product_images.size > 10
  end
end
