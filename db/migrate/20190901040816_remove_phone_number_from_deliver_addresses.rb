class RemovePhoneNumberFromDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliver_addresses, :phone_number, :integer
  end
end
