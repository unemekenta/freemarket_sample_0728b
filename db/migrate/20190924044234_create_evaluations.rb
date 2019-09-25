class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer             :rating, null: false
      t.text                :comment
      t.references          :seller, foreign_key: {to_table: :users}
      t.references          :buyer, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
