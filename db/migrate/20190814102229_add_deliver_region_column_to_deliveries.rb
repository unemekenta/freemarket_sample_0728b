class AddDeliverRegionColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_reference :deliveries, :deliver_region, null: false, foreign_key: true
  end
end
