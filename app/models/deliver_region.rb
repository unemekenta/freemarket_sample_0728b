class DeliverRegion < ApplicationRecord
  has_one :delivery

  validates :region, presence: true
end
