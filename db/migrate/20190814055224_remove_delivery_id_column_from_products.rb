class RemoveDeliveryIdColumnFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :delivery, null: false, foreign_key: true
  end
end
