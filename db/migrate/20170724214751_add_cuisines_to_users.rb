class AddCuisinesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cuisine1, :string
    add_column :users, :cuisine2, :string
    add_column :users, :cuisine3, :string
    add_column :users, :cuisine4, :string
    add_column :users, :cuisine5, :string
  end
end
