class CreateEstimatedDates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimated_dates do |t|
      t.string :date, null: false
      t.timestamps
    end
  end
end
