class AddFirstNamePseudonymToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name_pseudonym, :string, null: false
  end
end
