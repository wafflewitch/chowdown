class CreateChows < ActiveRecord::Migration[5.0]
  def change
    create_table :chows do |t|
      t.date :date
      t.string :status
      t.string :location

      t.timestamps
    end
  end
end
