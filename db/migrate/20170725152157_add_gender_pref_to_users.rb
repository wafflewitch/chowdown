class AddGenderPrefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender_pref, :string
  end
end
