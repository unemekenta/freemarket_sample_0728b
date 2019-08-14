class ChangeStatusIdColumnOnProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :status_id, 1
  end
end
