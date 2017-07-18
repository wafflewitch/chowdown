class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.date :dates
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
