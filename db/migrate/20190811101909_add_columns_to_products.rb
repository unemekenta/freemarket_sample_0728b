class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :status, null: false, foreign_key: true
    add_reference :products, :condition, null: false, foreign_key: true
  end
end
