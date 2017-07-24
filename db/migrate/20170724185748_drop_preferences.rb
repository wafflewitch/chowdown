class DropPreferences < ActiveRecord::Migration[5.0]
  def change
    drop_table :preferences
  end
end
