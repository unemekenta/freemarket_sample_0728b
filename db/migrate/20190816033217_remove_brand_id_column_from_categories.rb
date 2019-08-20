class RemoveBrandIdColumnFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :brand
  end
end
