class AddFamilyNamePseudonymToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name_pseudonym, :string, null: false
  end
end
