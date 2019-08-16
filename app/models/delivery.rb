class Delivery < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :deliver_method
  belongs_to :estimated_date
  belongs_to :deliver_region
end
