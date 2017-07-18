class AddUsersToChows < ActiveRecord::Migration[5.0]
  def change
    add_column :chows, :user_1_id, :integer
    add_column :chows, :user_2_id, :integer
  end
end
