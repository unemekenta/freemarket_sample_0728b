class AddProductIdColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_reference :deliveries, :product, null: false, foreign_key: true
  end
end
