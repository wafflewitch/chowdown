class ChangePrefsInUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :pref_meat, :string
    remove_column :users, :pref_fish, :string
    remove_column :users, :pref_wheat, :string
    add_column :users, :pref_meat, :boolean, :default => true
    add_column :users, :pref_fish, :boolean, :default => true
    add_column :users, :pref_wheat, :boolean, :default => true
  end
end
