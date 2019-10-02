class Evaluation < ApplicationRecord

  belongs_to  :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to  :seller, class_name: 'User', foreign_key: 'seller_id'
  
  scope :latest30, -> (current_user){ where(seller_id: current_user.id).order("id DESC").limit(30)}

end
