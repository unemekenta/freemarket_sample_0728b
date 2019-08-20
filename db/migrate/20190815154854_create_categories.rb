class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category, null: false
      t.integer :parent_id
      t.references :brand, foreign_key: true
      t.references :size_type, foreign_key: true
      t.timestamps
    end
  end
end
