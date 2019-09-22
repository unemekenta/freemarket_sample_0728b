class EstimatedDate < ApplicationRecord
  has_one :delivery

  validates :date, presence: true
end
