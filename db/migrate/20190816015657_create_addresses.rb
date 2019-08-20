class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer      :post_number
      t.string        :prefecture
      t.string        :city
      t.string        :street
      t.string        :building 
      t.references        :user
      t.timestamps null: true
    end
  end
end
