class ChangeAddressInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :address, :text
  end
end
