class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :photo, :string, null: true, default: 0
    change_column :users, :phone_number, :integer, null: true, default: 0
  end

  # 変更前の状態
  def down
    change_column :users, :photo, :string
    change_column :users, :phone_number, :integer
  end
end
