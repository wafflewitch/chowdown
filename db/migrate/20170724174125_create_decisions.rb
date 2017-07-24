class CreateDecisions < ActiveRecord::Migration[5.0]
  def change
    create_table :decisions do |t|
      t.integer :user_1_id, index: true, foreign_key: true
      t.integer :user_2_id, index: true, foreign_key: true
      t.boolean :like

      t.timestamps
    end
    add_foreign_key :decisions, :users, column: :user_1_id
    add_foreign_key :decisions, :users, column: :user_2_id
  end
end
