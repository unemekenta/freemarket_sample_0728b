class CreateDeliveraddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveraddresses do |t|
      t.string        :family_name, null: false
      t.string        :first_name, null: false
      t.string        :family_name_pseudonym, null: false
      t.string        :first_name_pseudonym, null: false
      t.string        :post_number
      t.string        :prefecture
      t.string        :city
      t.string        :street
      t.string        :building, null: true
      t.string       :phone_number, null: true
      t.references    :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
