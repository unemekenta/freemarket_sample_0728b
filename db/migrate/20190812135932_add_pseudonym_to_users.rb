class AddPseudonymToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pseudonym, :string, null: false
  end
end
