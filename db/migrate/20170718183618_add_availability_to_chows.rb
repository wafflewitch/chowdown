class AddAvailabilityToChows < ActiveRecord::Migration[5.0]
  def change
    add_column :chows, :availability_1_id, :integer
    add_column :chows, :availability_2_id, :integer
  end
end
