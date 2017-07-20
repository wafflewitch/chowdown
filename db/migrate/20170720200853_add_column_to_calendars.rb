class AddColumnToCalendars < ActiveRecord::Migration[5.0]
  def change
    add_column :calendars, :chow_id, :integer
  end
end
