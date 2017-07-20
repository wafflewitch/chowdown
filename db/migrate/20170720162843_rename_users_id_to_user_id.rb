class RenameUsersIdToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :badges, :users_id, :user_id
    rename_column :preferences, :users_id, :user_id
  end
end
