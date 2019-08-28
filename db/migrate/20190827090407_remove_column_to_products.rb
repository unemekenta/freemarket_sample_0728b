class RemoveColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_columns :products, :seller_id, :seller
  end
end
