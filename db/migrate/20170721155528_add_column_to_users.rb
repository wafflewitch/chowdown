class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pref_meat, :string
    add_column :users, :pref_fish, :string
    add_column :users, :pref_wheat, :string
  end
end
