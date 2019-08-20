class CreateDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_addresses do |t|
      t.string        :family_name
      t.string        :first_name
      t.string        :family_name_pseudonym
      t.string        :first_name_pseudonym
      t.string        :post_number
      t.string        :prefecture
      t.string        :city
      t.string        :street
      t.string        :building
      t.integer       :phone_number
      t.references    :user
      t.timestamps null: true
    end
  end
end
