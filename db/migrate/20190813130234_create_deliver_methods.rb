class CreateDeliverMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_methods do |t|
      t.string :method, null: false
      t.timestamps
    end
  end
end
