class Address < ApplicationRecord
  belongs_to :user, optional: true

  VALID_POST_NUMBER = /\A\d{3}[-]\d{4}\z|\A\d{3}[-]\d{2}\Z|\A\d{3}\z|\A\d{5}\z|\A\d{7}\z/

  validates :post_number, presence: true, format: {with: VALID_POST_NUMBER}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street, presence: true

end
