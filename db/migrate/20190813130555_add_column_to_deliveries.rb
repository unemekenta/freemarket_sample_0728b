class AddColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_reference :deliveries, :deliver_method, null: false, foreign_key: true
    add_reference :deliveries, :estimated_date, null: false, foreign_key: true
  end
end
