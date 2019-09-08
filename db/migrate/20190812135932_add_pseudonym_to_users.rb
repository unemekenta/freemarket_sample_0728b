class AddPseudonymToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pseudonym, :string
  end
end
