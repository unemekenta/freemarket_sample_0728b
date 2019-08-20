class AddColumnToSizes < ActiveRecord::Migration[5.2]
  def change
    add_reference :sizes, :size_type, null: false, foreign_key: true
  end
end
