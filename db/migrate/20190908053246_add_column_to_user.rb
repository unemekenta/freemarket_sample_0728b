class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text
    add_reference :users, :credit_card, foreign_key: true, null: true, default: '' 
  end
end
