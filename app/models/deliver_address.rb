class DeliverAddress < ApplicationRecord
  belongs_to :user, optional: true
end
