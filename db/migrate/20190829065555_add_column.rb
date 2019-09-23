class AddColumn < ActiveRecord::Migration[5.2]
  def up
    # add_reference :products, :seller, foreign_key: {to_table: :users}
    change_column :addresses, :post_number, :string, null: false
    change_column :addresses, :prefecture, :string, null: false
    change_column :addresses, :city, :string, null: false
    change_column :addresses, :street, :string, null: false
    change_column :users, :nickname, :string, null: false
    change_column :users, :birthday, :date, null: false
    change_column :users, :family_name, :string, null: false
    change_column :users, :first_name, :string, null: false
    change_column :users, :family_name_pseudonym, :string, null: false
    change_column :users, :first_name_pseudonym, :string, null: false

  end

  def down
    change_column :addresses, :post_number, :integer, null: true
    change_column :addresses, :prefecture, :string, null: true
    change_column :addresses, :city, :string, null: true
    change_column :addresses, :street, :string, null: true
    change_column :users, :nickname, :string, null: true
    change_column :users, :birthday, :date, null: true
    change_column :users, :family_name, :string, null: true
    change_column :users, :first_name, :string, null: true
    change_column :users, :family_name_pseudonym, :string, null: true
    change_column :users, :first_name_pseudonym, :string, null: true
  end
end

