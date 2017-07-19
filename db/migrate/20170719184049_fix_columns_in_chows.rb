class FixColumnsInChows < ActiveRecord::Migration[5.0]
  def change
    rename_column :chows, :date_1_id, :calendar_1_id
    rename_column :chows, :date_2_id, :calendar_2_id
  end
end
