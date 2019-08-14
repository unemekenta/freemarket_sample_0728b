class AddDeliveryAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :delivery_address, foreign_key: true
  end
end
