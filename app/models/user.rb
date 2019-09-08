class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable

  has_one :address
  has_one :deliveraddress
  accepts_nested_attributes_for :address
  has_many :products, through: :purchases
  has_many :purchases
  has_many :credit_cards

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
