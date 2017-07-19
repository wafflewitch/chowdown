class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.references :user, foreign_key: true
      t.date :dates, array: true, default: []

      t.timestamps
    end
  end
end
