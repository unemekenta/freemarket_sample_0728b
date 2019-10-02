class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable

  mount_uploader :photo, ImageUploader

  has_one :address
  has_one :deliveraddress
  has_one :credit_card
  has_one :point
  
  accepts_nested_attributes_for :address
  has_many :products, through: :purchases
  has_many :comments
  has_many :purchases
  has_many :evaluations
  has_many :likes, dependent: :destroy
  has_many :like_products, through: :likes, source: :product

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, length: {minimum: 6}, on: :create
  validates :password, length: {minimum: 6}, on: :update, allow_blank: true
  validates :password_confirmation, length: { minimum: 6 }, on: :create
  validates :password_confirmation, length: { minimum: 6 }, on: :update, allow_blank: true
  validates :birthday, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_pseudonym, presence: true
  validates :first_name_pseudonym, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first
  end

  def self.new_with_session(_, session)
    super.tap do |user|
      if (data = session['devise.omniauth_data'])
        user.email = data['email'] if user.email.blank?
        user.nickname = data['name'] if user.nickname.blank?
      end
    end
  end
end
