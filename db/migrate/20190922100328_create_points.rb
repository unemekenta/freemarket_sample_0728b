class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :point, null: false
      t.timestamps
    end
  end
end
