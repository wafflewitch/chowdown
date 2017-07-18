class CreateDietPrefs < ActiveRecord::Migration[5.0]
  def change
    create_table :diet_prefs do |t|
      t.string :name
      t.string :icon
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
