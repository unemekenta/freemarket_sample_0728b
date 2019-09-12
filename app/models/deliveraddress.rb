class Deliveraddress < ApplicationRecord
  belongs_to :user, optional: true

  VALID_POST_NUMBER = /\A\d{3}[-]\d{4}\z|\A\d{3}[-]\d{2}\Z|\A\d{3}\z|\A\d{5}\z|\A\d{7}\z/
  VALID_PHONE_NUMBER = /\A\d{10,11}\z/
  VALID_PSEUDONYM = /\A[ァ-ヶー－]+\z/
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_pseudonym, presence: true, format: {with: VALID_PSEUDONYM}
  validates :first_name_pseudonym, presence: true, format: {with: VALID_PSEUDONYM}
  validates :post_number, presence: true, format: {with: VALID_POST_NUMBER}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, numericality: true, allow_blank: true ,format: {with: VALID_PHONE_NUMBER}
  validates :user_id, presence: true
end
