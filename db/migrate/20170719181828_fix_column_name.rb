class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :chows, :availability_1_id, :date_1_id
    rename_column :chows, :availability_2_id, :date_2_id
  end
end
