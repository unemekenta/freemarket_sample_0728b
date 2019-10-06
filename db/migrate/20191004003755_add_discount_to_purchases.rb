class AddDiscountToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :discount, :integer
  end
end
