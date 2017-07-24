class RemoveCuisinesFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :cuisine1, :string
    remove_column :users, :cuisine2, :string
    remove_column :users, :cuisine3, :string
    remove_column :users, :cuisine4, :string
    remove_column :users, :cuisine5, :string
  end
end
