class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.integer :count
      t.string :category
      t.integer :level
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
