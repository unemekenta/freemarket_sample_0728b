class CreateDeliverRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_regions do |t|
      t.string :region, null: false
      t.timestamps
    end
  end
end
