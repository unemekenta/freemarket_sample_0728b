class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :product, foreign_key: true, null: false
      t.references :seller, foreign_key: {to_table: :users}, null: false
      t.references :buyer, foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
