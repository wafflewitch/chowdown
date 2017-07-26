class FixColumnsInChows < ActiveRecord::Migration[5.0]
  def change
    add_column :chows, :calendar_1_id, :integer
    add_column :chows, :calendar_2_id, :integer
  end
end
