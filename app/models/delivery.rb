class Delivery < ApplicationRecord
  belongs_to :product, optional: true
  has_one :deliver_method
  has_one :estimated_date
end
