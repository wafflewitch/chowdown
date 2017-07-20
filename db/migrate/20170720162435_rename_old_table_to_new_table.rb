class RenameOldTableToNewTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :diet_prefs, :preferences
  end
end
