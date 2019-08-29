class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :delivery, null: false, foreign_key: true
  end
end
